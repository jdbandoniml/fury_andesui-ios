//
//  AndesCoachMarkEntity.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 24/04/2020.
//

public struct AndesCoachMarkEntity {
    public let steps: [AndesCoachMarkStepEntity]
    public let scrollView: UIScrollView?
    public let completionHandler: (() -> Void)?

    public init(steps: [AndesCoachMarkStepEntity],
                scrollView: UIScrollView?,
                completionHandler: (() -> Void)?) {

        self.steps = steps
        self.scrollView = scrollView
        self.completionHandler = completionHandler
    }
}
