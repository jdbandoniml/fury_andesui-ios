//
//  AndesCoachMarkScrollInteractor.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 24/04/2020.
//

import Foundation

class AndesCoachMarkScrollInteractor {
    
    private var highlightedView: UIView
    private var scrollView: UIScrollView
    private var bodyView: UIView
    private var margin: CGFloat
    private var animated: Bool

    
    required init(_ highlightedView: UIView, scrollView: UIScrollView, bodyView: UIView, margin: CGFloat = 0, animated: Bool = true) {
        self.highlightedView = highlightedView
        self.scrollView = scrollView
        self.bodyView = bodyView
        self.margin = margin
        self.animated = animated
    }
    
    func isScrollNeeded() -> Bool {
        guard let bodyViewContentSize = (bodyView.subviews.reduce(nil) { (rect, subview) -> CGRect in
            return (rect ?? subview.frame) + subview.frame
        }) else {
            return false
        }
        
        let highlightedViewConverted = highlightedView.convert(highlightedView.bounds, to: bodyView)
        
        let rect = bodyViewContentSize + highlightedViewConverted
        let rectWithMargin = CGRect(x: rect.minX, y: rect.minY - (rect.isAbove(of: bodyView.frame) ? margin : 0), width: rect.width, height: rect.height + (rect.isAbove(of: bodyView.frame) || rect.isBelow(of: bodyView.frame) ? margin : 0))
        
        //Make sure that the rect fit on body view. if it doesn't, it doesn't have scrolling!
        return !bodyView.bounds.contains(rectWithMargin) && (bodyView.bounds.height >= rectWithMargin.height)
    }
    
    func scrollIfNeeded(completion: (() -> ())? = nil) {
        //If coachmark is partially invisible at least, I need to scroll
        //If coachmark is visible and referenceview is uncompletely visible I need to scroll as match as posible without hiding the coachmark

        guard let bodyViewContentSize = (bodyView.subviews.reduce(nil) { (rect, subview) -> CGRect in
            return (rect ?? subview.frame) + subview.frame
        }) else {
            completion?()
            return
        }
        
        let highlightedViewConverted = highlightedView.convert(highlightedView.bounds, to: bodyView)
        
        let rect = bodyViewContentSize + highlightedViewConverted
        let rectWithMargin = CGRect(x: rect.minX, y: rect.minY - (rect.isAbove(of: bodyView.frame) ? margin : 0), width: rect.width, height: rect.height + (rect.isAbove(of: bodyView.frame) || rect.isBelow(of: bodyView.frame) ? margin : 0))
        if !bodyView.bounds.contains(rectWithMargin) {
            let newOffset: CGPoint
            let bodyViewConvertedToScrollViewOrigin = bodyView.convert(bodyView.bounds, to: scrollView)
            
            if rectWithMargin.isAbove(of: bodyView.bounds) {
                newOffset = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y + rectWithMargin.minY - bodyViewConvertedToScrollViewOrigin.minY)
            } else {
                newOffset = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y + rectWithMargin.maxY - bodyViewConvertedToScrollViewOrigin.maxY)
            }
            
            if animated {
                UIView.animate(
                    withDuration: 1,
                    animations: { [weak self] in
                        guard let self = self else { return }
                        self.scrollView.contentOffset = newOffset
                    },
                    completion: { _ in
                        completion?()
                    }
                )
            } else {
                self.scrollView.contentOffset = newOffset
                completion?()
            }
        
            return
        }

        //Otherwise I don't need to scroll
        completion?()
        return
    }
    
    func restore(completion: (() -> ())? = nil) -> Bool {
        guard scrollView.contentOffset != .zero else {
            completion?()
            return false
        }
        
        if animated {
            UIView.animate(
                withDuration: 1,
                animations: { [weak self] in
                    guard let self = self else { return }
                    self.scrollView.contentOffset = .zero
                },
                completion: { _ in
                    completion?()
                }
            )
        } else {
            scrollView.contentOffset = .zero
            completion?()
        }
        
        return true
    }
    
}

extension CGRect {
    static func +(lhs: CGRect, rhs: CGRect) -> CGRect {
        let x = min(lhs.minX,rhs.minX)
        let y = min(lhs.minY,rhs.minY)
        
        return CGRect(x: x,
                      y: y,
                      width: abs(max(lhs.maxX,rhs.maxX) - x),
                      height: abs(max(lhs.maxY,rhs.maxY) - y))
    }
    
    func isAbove(of rect: CGRect) -> Bool {
        return self.minY < rect.minY
    }
    
    func isBelow(of rect: CGRect) -> Bool {
        return self.maxY > rect.maxY
    }
}
