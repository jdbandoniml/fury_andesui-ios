//
//  AndesCoachmarkPresenterTests.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 12/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import AndesUI

class AndesCoachmarkPresenterTests: QuickSpec {

    override func spec() {
        describe("Andes Coachmark Presenter Tests") {
            context("test some internal functions") {
                let resolver = AndesCoachmarkStubsResolver(.oneStep)
                let presenter = AndesCoachMarkPresenter(model: resolver.model, animated: false)

                it("should get window bounds") {
                    expect(presenter.getWindow()).to(equal(UIApplication.shared.windows.filter {$0.isKeyWindow}.last))
                }
                it("should get status bar height") {
                    expect(presenter.getStatusBarHeight()).to(equal(20))
                }
            }

            context("test with one step") {
                it("should create correctly") {
                    let resolver = AndesCoachmarkStubsResolver(.oneStep)
                    let presenter = AndesCoachMarkPresenter(model: resolver.model, animated: false)

                    expect(presenter.animated).to(beFalse())
                    expect(presenter.model.scrollView).to(equal(resolver.scrollView))
                    expect(presenter.model.steps.count).to(equal(1))
                    expect(presenter.model.completionHandler).to(beNil())
                }

                it("should start correctly") {
                    let resolver = AndesCoachmarkStubsResolver(.oneStep)
                    let presenter = AndesCoachMarkPresenter(model: resolver.model, animated: false)
                    let viewDelegateMock = CoachmarkViewMock(bodyView: resolver.bodyView)

                    presenter.view = viewDelegateMock
                    presenter.start()

                    MockSwift.verify(viewDelegateMock.didCallSetBody, wasCalledTimes: 3)
                    MockSwift.verify(viewDelegateMock.didCallSetNavBar)
                    MockSwift.verify(viewDelegateMock.didCallSetFooter)
                    MockSwift.verify(viewDelegateMock.didCallHideBody)
                    MockSwift.verify(viewDelegateMock.didCallHide)
                    MockSwift.verify(viewDelegateMock.didCallShow)
                    MockSwift.verify(viewDelegateMock.didCallSetHighlight)
                    MockSwift.verify(viewDelegateMock.didCallRemoveHighlight)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 10)

                }

                it("should try to move next and finish because is the last one") {
                    let resolver = AndesCoachmarkStubsResolver(.oneStep)
                    let presenter = AndesCoachMarkPresenter(model: resolver.model, animated: false)
                    var viewDelegateMock = CoachmarkViewMock(bodyView: resolver.bodyView)

                    presenter.view = viewDelegateMock
                    presenter.start()

                    //Restart viewDelegate so that it can only check the NextActionTap
                    viewDelegateMock = CoachmarkViewMock(bodyView: resolver.bodyView)
                    presenter.view = viewDelegateMock
                    presenter.didNextActionTap()
                    MockSwift.verify(viewDelegateMock.didCallShowNext)
                    MockSwift.verify(viewDelegateMock.didCallHide)
                    MockSwift.verify(viewDelegateMock.didCallRemoveHighlight)
                    MockSwift.verify(viewDelegateMock.didCallExit)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 4)
                }

                it("should close and exit") {
                    let resolver = AndesCoachmarkStubsResolver(.oneStep)
                    let presenter = AndesCoachMarkPresenter(model: resolver.model, animated: false)
                    var viewDelegateMock = CoachmarkViewMock(bodyView: resolver.bodyView)

                    presenter.view = viewDelegateMock
                    presenter.start()

                    //Restart viewDelegate so that it can only check the CloseButtonTap
                    viewDelegateMock = CoachmarkViewMock(bodyView: resolver.bodyView)
                    presenter.view = viewDelegateMock
                    presenter.didCloseButtonTap()
                    MockSwift.verify(viewDelegateMock.didCallClose)
                    MockSwift.verify(viewDelegateMock.didCallHide)
                    MockSwift.verify(viewDelegateMock.didCallRemoveHighlight)
                    MockSwift.verify(viewDelegateMock.didCallExit)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 4)
                }
            }
            context("test with two steps") {
                it("should create correctly") {
                    let resolver = AndesCoachmarkStubsResolver(.twoSteps)
                    let presenter = AndesCoachMarkPresenter(model: resolver.model, animated: false)

                    expect(presenter.animated).to(beFalse())
                    expect(presenter.model.scrollView).to(equal(resolver.scrollView))
                    expect(presenter.model.steps.count).to(equal(2))
                    expect(presenter.model.completionHandler).to(beNil())
                }

                it("should start correctly") {
                    let resolver = AndesCoachmarkStubsResolver(.twoSteps)
                    let presenter = AndesCoachMarkPresenter(model: resolver.model, animated: false)
                    let viewDelegateMock = CoachmarkViewMock(bodyView: resolver.bodyView)

                    presenter.view = viewDelegateMock
                    presenter.start()

                    MockSwift.verify(viewDelegateMock.didCallSetBody, wasCalledTimes: 3)
                    MockSwift.verify(viewDelegateMock.didCallSetNavBar)
                    MockSwift.verify(viewDelegateMock.didCallSetFooter)
                    MockSwift.verify(viewDelegateMock.didCallHideBody)
                    MockSwift.verify(viewDelegateMock.didCallHide)
                    MockSwift.verify(viewDelegateMock.didCallShow)
                    MockSwift.verify(viewDelegateMock.didCallSetHighlight)
                    MockSwift.verify(viewDelegateMock.didCallRemoveHighlight)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 10)
                }

                it("should move next") {
                    let resolver = AndesCoachmarkStubsResolver(.twoSteps)
                    let presenter = AndesCoachMarkPresenter(model: resolver.model, animated: false)
                    var viewDelegateMock = CoachmarkViewMock(bodyView: resolver.bodyView)

                    presenter.view = viewDelegateMock
                    presenter.start()

                    //Restart viewDelegate so that it can only check the NextActionTap
                    viewDelegateMock = CoachmarkViewMock(bodyView: resolver.bodyView)
                    presenter.view = viewDelegateMock
                    presenter.didNextActionTap()
                    MockSwift.verify(viewDelegateMock.didCallShowNext)
                    MockSwift.verify(viewDelegateMock.didCallSetBody)
                    MockSwift.verify(viewDelegateMock.didCallSetNavBar)
                    MockSwift.verify(viewDelegateMock.didCallSetFooter)
                    MockSwift.verify(viewDelegateMock.didCallHideBody)
                    MockSwift.verify(viewDelegateMock.didCallShow)
                    MockSwift.verify(viewDelegateMock.didCallSetHighlight)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 7)
                }

                it("should close and exit") {
                    let resolver = AndesCoachmarkStubsResolver(.twoSteps)
                    let presenter = AndesCoachMarkPresenter(model: resolver.model, animated: false)
                    var viewDelegateMock = CoachmarkViewMock(bodyView: resolver.bodyView)

                    presenter.view = viewDelegateMock
                    presenter.start()

                    //Restart viewDelegate so that it can only check the CloseButtonTap
                    viewDelegateMock = CoachmarkViewMock(bodyView: resolver.bodyView)
                    presenter.view = viewDelegateMock
                    presenter.didCloseButtonTap()
                    MockSwift.verify(viewDelegateMock.didCallClose)
                    MockSwift.verify(viewDelegateMock.didCallHide)
                    MockSwift.verify(viewDelegateMock.didCallRemoveHighlight)
                    MockSwift.verify(viewDelegateMock.didCallExit)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 4)
                }
            }
        }
    }
}
