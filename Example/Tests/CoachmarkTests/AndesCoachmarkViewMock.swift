//
//  AndesCoachmarkViewMock.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 12/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
@testable import AndesUI

class CoachmarkViewMock: AndesCoachMarkViewProtocol, Mock {
    var bodyView: UIView?

    var didCallShow = MockCounter()
    var didCallHide = MockCounter()
    var didCallSetHighlight = MockCounter()
    var didCallRemoveHighlight = MockCounter()
    var didCallSetNavBar = MockCounter()
    var didCallSetBody = MockCounter()
    var didCallHideBody = MockCounter()
    var didCallSetFooter = MockCounter()
    var didCallShowNext = MockCounter()
    var didCallClose = MockCounter()
    var didCallExit = MockCounter()

    required init(bodyView: UIView) {
        self.bodyView = bodyView
    }

    func show() {
        didCallShow.wasCalled()
    }

    func hide() {
        didCallHide.wasCalled()
    }

    func setHighlight(frame: CGRect, cornerRadius: CGFloat, maskPath: CGPath) {
        didCallSetHighlight.wasCalled()
    }

    func removeHighlight() {
        didCallRemoveHighlight.wasCalled()
    }

    func setNavBar(_ title: String) {
        didCallSetNavBar.wasCalled()
    }

    func setBody(_ presenter: AndesCoachMarkBodyPresenter, removePrevious: Bool) {
        didCallSetBody.wasCalled()
    }

    func hideBody() {
        didCallHideBody.wasCalled()
    }

    func setFooter(_ nextText: String) {
        didCallSetFooter.wasCalled()
    }

    func showNext(stepIndex: Int) {
        didCallShowNext.wasCalled()
    }

    func close(stepIndex: Int) {
        didCallClose.wasCalled()
    }

    func exit() {
        didCallExit.wasCalled()
    }
}
