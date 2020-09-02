//
//  AndesCoachMarkViewDelegate.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 04/06/2020.
//

import Foundation

@objc public protocol AndesCoachMarkViewDelegate: class {
    @objc func onShowNext(stepIndex: Int)
    @objc func onClose(stepIndex: Int)
}
