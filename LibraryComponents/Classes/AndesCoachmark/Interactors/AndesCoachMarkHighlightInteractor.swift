//
//  AndesCoachMarkHighlightInteractor.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 28/07/2020.
//

import Foundation

protocol AndesCoachMarkHighlightInteractorProtocol: class {
    func getHighlightRect() -> CGRect
    func getHighlightCornerRadius() -> CGFloat
    func getMaskPath() -> CGPath
    func isHighlightedViewBelow() -> Bool
}

class AndesCoachMarkHighlightInteractor {

    private let overlayView: UIView
    private let view: UIView
    private let bodyViewBounds: CGRect
    private let style: AndesCoachMarkStepEntity.Style
    private let margin: CGFloat

    private lazy var highlightedRect: CGRect = highlightedRectCalculation()

    required init (overlayView: UIView, view: UIView, bodyViewBounds: CGRect, style: AndesCoachMarkStepEntity.Style, margin: CGFloat = AndesCoachMarkConstants.Highlight.margin) {
        self.overlayView = overlayView
        self.view = view
        self.bodyViewBounds = bodyViewBounds
        self.style = style
        self.margin = margin
    }

    private func highlightedRectCalculation() -> CGRect {
        let margin = self.margin + 4
        let rectConverted = view.convert(view.bounds, to: overlayView)

        if !bodyViewBounds.contains(rectConverted.insetBy(dx: bodyViewBounds.minX, dy: -margin)) {
            if rectConverted.isAbove(of: bodyViewBounds) {
                return CGRect(x: rectConverted.minX, y: bodyViewBounds.minY + margin, width: rectConverted.width, height: rectConverted.maxY - bodyViewBounds.minY - margin)
            } else {
                return CGRect(x: rectConverted.minX, y: rectConverted.minY, width: rectConverted.width, height: bodyViewBounds.maxY - rectConverted.minY - margin)
            }
        } else {
            return rectConverted
        }
    }

    private func buildSquareFrom(rect: CGRect, margin: CGFloat) -> UIBezierPath {
        return UIBezierPath(roundedRect: rect.insetBy(dx: -margin, dy: -margin), cornerRadius: AndesCoachMarkConstants.Highlight.cornerRadius)
    }

    private func buildCircleFrom(rect: CGRect, margin: CGFloat) -> UIBezierPath {
        return UIBezierPath(roundedRect: rect.insetBy(dx: -margin, dy: -margin), cornerRadius: (rect.width+margin)/2)
    }

}

extension AndesCoachMarkHighlightInteractor: AndesCoachMarkHighlightInteractorProtocol {
    func getHighlightRect() -> CGRect {
        return highlightedRect.insetBy(dx: -margin, dy: -margin)
    }

    func getHighlightCornerRadius() -> CGFloat {
        let rect = getHighlightRect()
        switch style {
        case .rectangle:
            return AndesCoachMarkConstants.Highlight.cornerRadius
        case .circle:
            return (rect.width)/2
        }
    }

    func getMaskPath() -> CGPath {
        let path = UIBezierPath(rect: overlayView.bounds)
        var viewPath: UIBezierPath

        switch style {
        case .rectangle:
            viewPath = buildSquareFrom(rect: highlightedRect, margin: margin)
        case .circle:
            viewPath = buildCircleFrom(rect: highlightedRect, margin: margin)
        }

        path.append(viewPath)

        return path.cgPath
    }

    func isHighlightedViewBelow() -> Bool {
        return view.convert(view.frame, to: overlayView).midY > bodyViewBounds.midY
    }
}
