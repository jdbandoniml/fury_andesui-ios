//
//  AndesCoachMarkViewDelegate.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 04/06/2020.
//

import Foundation

public protocol AndesCoachMarkViewDelegate: class {
    func onShowNext(stepIndex: Int)
    func onClose(stepIndex: Int)
}
