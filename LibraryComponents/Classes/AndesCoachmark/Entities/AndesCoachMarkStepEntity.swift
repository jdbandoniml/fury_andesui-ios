//
//  AndesCoachMarkStepEntity.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 04/06/2020.
//

@objc public class AndesCoachMarkStepEntity: NSObject {
    @objc public enum HighlightStyle: Int {
        case rectangle
        case circle
    }

    let title: String
    let descriptionText: String
    let view: UIView
    let style: HighlightStyle
    let nextText: String

    @objc public init (title: String,
                 description: String,
                 view: UIView,
                 style: HighlightStyle,
                 nextText: String) {

        self.title = title
        self.descriptionText = description
        self.nextText = nextText
        self.view = view
        self.style = style
    }
}
