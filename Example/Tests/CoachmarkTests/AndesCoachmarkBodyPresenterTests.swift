//
//  AndesCoachmarkBodyPresenterTests.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 13/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import AndesUI

class AndesCoachmarkBodyPresenterTests: QuickSpec {

    override func spec() {
        describe("Andes Coachmark Body Presenter Tests") {
            context("test viewLaidOut") {
                it("should be executed once") {
                    let resolver: AndesCoachmarkBodyStubsResolver = AndesCoachmarkBodyStubsResolver(.centerAboveView)
                    guard let model = resolver.model else {
                        fail()
                        return
                    }
                    let presenter = AndesCoachMarkBodyPresenter(model: model)
                    let viewDelegateMock = AndesCoachmarkBodyViewMock()
                    presenter.view = viewDelegateMock

                    presenter.viewLaidOut()
                    let numberOfCalls = viewDelegateMock.totalNumberOfCalls()
                    presenter.viewLaidOut()

                    expect(numberOfCalls).to(equal(viewDelegateMock.totalNumberOfCalls()))
                }
                it("should set title and description correctly") {
                    let resolver: AndesCoachmarkBodyStubsResolver = AndesCoachmarkBodyStubsResolver(.centerAboveView)
                    guard let model = resolver.model else {
                        fail()
                        return
                    }
                    let presenter = AndesCoachMarkBodyPresenter(model: model)
                    let viewDelegateMock = AndesCoachmarkBodyViewMock()
                    presenter.view = viewDelegateMock
                    presenter.viewLaidOut()

                    MockSwift.verify(viewDelegateMock.didCallSetupTitleLabel)
                    MockSwift.verify(viewDelegateMock.didCallSetupDescriptionLabel)
                    expect(viewDelegateMock.title).to(equal(model.title))
                    expect(viewDelegateMock.description).to(equal(model.description))
                }
            }
            context("test arrow drawing") {
                it("should just draw text above") {
                    let resolver: AndesCoachmarkBodyStubsResolver = AndesCoachmarkBodyStubsResolver(.centerAboveView)
                    guard let model = resolver.model else {
                        fail()
                        return
                    }
                    let presenter = AndesCoachMarkBodyPresenter(model: model)
                    let viewDelegateMock = AndesCoachmarkBodyViewMock()
                    presenter.view = viewDelegateMock
                    presenter.viewLaidOut()

                    MockSwift.verify(viewDelegateMock.didCallSetupTextAbove)
                    MockSwift.verify(viewDelegateMock.didCallConvertCoordinates, wasCalledTimes: 2)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 5)
                    expect(viewDelegateMock.positionY).to(equal(41))
                    expect(viewDelegateMock.arrowWidth).to(beNil())
                }
                it("should just draw text below") {
                    let resolver: AndesCoachmarkBodyStubsResolver = AndesCoachmarkBodyStubsResolver(.centerLeftBelowView)
                    guard let model = resolver.model else {
                        fail()
                        return
                    }
                    let presenter = AndesCoachMarkBodyPresenter(model: model)
                    let viewDelegateMock = AndesCoachmarkBodyViewMock()
                    presenter.view = viewDelegateMock
                    presenter.viewLaidOut()

                    MockSwift.verify(viewDelegateMock.didCallSetupTextBelow)
                    MockSwift.verify(viewDelegateMock.didCallConvertCoordinates, wasCalledTimes: 2)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 5)
                    expect(viewDelegateMock.positionY).to(equal(40))
                    expect(viewDelegateMock.arrowWidth).to(beNil())
                }
                it("should draw arrow to left below") {
                    let resolver: AndesCoachmarkBodyStubsResolver = AndesCoachmarkBodyStubsResolver(.leftBelowView)
                    guard let model = resolver.model else {
                        fail()
                        return
                    }
                    let presenter = AndesCoachMarkBodyPresenter(model: model)
                    let viewDelegateMock = AndesCoachmarkBodyViewMock()
                    presenter.view = viewDelegateMock
                    presenter.viewLaidOut()

                    MockSwift.verify(viewDelegateMock.didCallSetupArrowBelowOfTextAndPointToLeft)
                    MockSwift.verify(viewDelegateMock.didCallConvertCoordinates)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 4)
                    expect(viewDelegateMock.positionY).to(equal(102))
                    expect(viewDelegateMock.arrowWidth).to(equal(65))
                }
                it("should draw arrow to right below") {
                    let resolver: AndesCoachmarkBodyStubsResolver = AndesCoachmarkBodyStubsResolver(.rightBelowView)
                    guard let model = resolver.model else {
                        fail()
                        return
                    }
                    let presenter = AndesCoachMarkBodyPresenter(model: model)
                    let viewDelegateMock = AndesCoachmarkBodyViewMock()
                    presenter.view = viewDelegateMock
                    presenter.viewLaidOut()

                    MockSwift.verify(viewDelegateMock.didCallSetupArrowBelowOfTextAndPointToRight)
                    MockSwift.verify(viewDelegateMock.didCallConvertCoordinates)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 4)
                    expect(viewDelegateMock.positionY).to(equal(102))
                    expect(viewDelegateMock.arrowWidth).to(equal(65))
                }
                it("should draw arrow to left above") {
                    let resolver: AndesCoachmarkBodyStubsResolver = AndesCoachmarkBodyStubsResolver(.leftAboveView)
                    guard let model = resolver.model else {
                        fail()
                        return
                    }
                    let presenter = AndesCoachMarkBodyPresenter(model: model)
                    let viewDelegateMock = AndesCoachmarkBodyViewMock()
                    presenter.view = viewDelegateMock
                    presenter.viewLaidOut()

                    MockSwift.verify(viewDelegateMock.didCallSetupArrowAboveOfTextAndPointToLeft)
                    MockSwift.verify(viewDelegateMock.didCallConvertCoordinates)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 4)
                    expect(viewDelegateMock.positionY).to(equal(48))
                    expect(viewDelegateMock.arrowWidth).to(equal(65))
                }
                it("should draw arrow to right above") {
                    let resolver: AndesCoachmarkBodyStubsResolver = AndesCoachmarkBodyStubsResolver(.rightAboveView)
                    guard let model = resolver.model else {
                        fail()
                        return
                    }
                    let presenter = AndesCoachMarkBodyPresenter(model: model)
                    let viewDelegateMock = AndesCoachmarkBodyViewMock()
                    presenter.view = viewDelegateMock
                    presenter.viewLaidOut()

                    MockSwift.verify(viewDelegateMock.didCallSetupArrowAboveOfTextAndPointToRight)
                    MockSwift.verify(viewDelegateMock.didCallConvertCoordinates)
                    MockSwift.verify(viewDelegateMock, wasCalledTimes: 4)
                    expect(viewDelegateMock.positionY).to(equal(48))
                    expect(viewDelegateMock.arrowWidth).to(equal(65))
                }
            }
        }
    }
}
