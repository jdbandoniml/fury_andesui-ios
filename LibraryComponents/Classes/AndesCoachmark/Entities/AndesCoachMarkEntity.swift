//
//  AndesCoachMarkEntity.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 24/04/2020.
//

public struct AndesCoachMarkEntity {
    let steps: [AndesCoachMarkStepEntity]
    let scrollView: UIScrollView?
    let completionHandler: (() -> Void)?

    public init(steps: [AndesCoachMarkStepEntity],
                scrollView: UIScrollView?,
                completionHandler: (() -> Void)?) {

        self.steps = steps
        self.scrollView = scrollView
        self.completionHandler = completionHandler
    }
}
