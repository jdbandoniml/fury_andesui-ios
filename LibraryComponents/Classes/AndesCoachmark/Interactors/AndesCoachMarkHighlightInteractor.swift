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

        //If the highlightRect dosen't fit in bodyView, it will be cutted
        //Horizontal excess
        let rectConvertedCuttedX = max(rectConverted.minX, margin)
        let rectConvertedCuttedWidth = (rectConverted.minX < margin ? rectConverted.width - (margin - rectConverted.minX) : rectConverted.width)

        //Vertical excess
        if !bodyViewBounds.contains(rectConverted.insetBy(dx: bodyViewBounds.minX, dy: -margin)) {
            if rectConverted.isAbove(of: bodyViewBounds) {
                return CGRect(x: rectConvertedCuttedX, y: bodyViewBounds.minY + margin, width: rectConvertedCuttedWidth, height: rectConverted.maxY - bodyViewBounds.minY - margin)
            } else {
                return CGRect(x: rectConvertedCuttedX, y: rectConverted.minY, width: rectConvertedCuttedWidth, height: bodyViewBounds.maxY - rectConverted.minY - margin)
            }
        } else {
            return CGRect(x: rectConvertedCuttedX, y: rectConverted.origin.y, width: rectConvertedCuttedWidth, height: rectConverted.height)
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
