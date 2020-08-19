//
//  AndesCoachMarkStepEntity.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 04/06/2020.
//

public struct AndesCoachMarkStepEntity {
    public enum Style {
        case rectangle
        case circle
    }

    public let title: String
    public let description: String
    public let view: UIView
    public let style: Style
    public let nextText: String

    public init (title: String,
                 description: String,
                 view: UIView,
                 style: Style,
                 nextText: String) {

        self.title = title
        self.description = description
        self.nextText = nextText
        self.view = view
        self.style = style
    }
}
