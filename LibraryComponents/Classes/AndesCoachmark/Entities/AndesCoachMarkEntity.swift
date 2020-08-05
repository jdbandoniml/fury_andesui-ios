//
//  AndesCoachMarkEntity.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 24/04/2020.
//

public struct AndesCoachMarkEntity {
    public let steps: [AndesCoachMarkStepEntity]
    public let scrollView: UIScrollView?
    public let completionHandler: (() -> ())?
    
    public init(steps: [AndesCoachMarkStepEntity],
                scrollView: UIScrollView?,
                completionHandler: (() -> ())?) {
        
        self.steps = steps
        self.scrollView = scrollView
        self.completionHandler = completionHandler
    }
}
