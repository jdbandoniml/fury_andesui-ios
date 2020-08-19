//
//  AndesCoachMarkConstants.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 03/08/2020.
//

import Foundation

class AndesCoachMarkConstants {

    private init() {}

}

extension AndesCoachMarkConstants {
    struct Arrow {
        static let radius = CGFloat(20)
        static let headHeight = CGFloat(8.6)
        static let headWidth = CGFloat(5)
        static let correction = CGFloat(0.5)
        static let downRotation = CGFloat.pi*11/12
        static let upRotation = CGFloat.pi/12
    }

    struct Animation {
        static let duration = TimeInterval(0.25)
        static let delay = TimeInterval(0.1)
    }

    struct Highlight {
        static let margin = CGFloat(12)
        static let borderMargin = CGFloat(1)
        static let borderWidth = CGFloat(3)
        static let cornerRadius = CGFloat(8)
    }
}
