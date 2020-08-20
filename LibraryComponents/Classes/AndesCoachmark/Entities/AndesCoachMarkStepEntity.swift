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

    let title: String
    let description: String
    let view: UIView
    let style: Style
    let nextText: String

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
