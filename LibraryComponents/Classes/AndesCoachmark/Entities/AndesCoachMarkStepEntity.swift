//
//  AndesCoachMarkStepEntity.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 04/06/2020.
//

public struct AndesCoachMarkStepEntity {
    public let highlighted: HighlightedEntity
    public let title: String
    public let description: String
    public let nextText: String

    public init (highlighted: HighlightedEntity,
                 title: String,
                 description: String,
                 nextText: String) {

        self.highlighted = highlighted
        self.title = title
        self.description = description
        self.nextText = nextText
    }
}

public extension AndesCoachMarkStepEntity {
    struct HighlightedEntity {
        public enum Style {
            case rectangle
            case circle
        }

        public let view: UIView
        public let style: Style

        public init (view: UIView, style: Style) {
            self.view = view
            self.style = style
        }
    }
}
