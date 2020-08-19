//
//  AndesCoachmarkNavBarTests.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 18/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesCoachmarkNavBarTests: QuickSpec {
    override func spec() {

        describe("Coachmark navigation bar tests") {
            context("Title and close") {
                it("Check that title was setted correctly") {
                    let navBar = AndesCoachMarkNavBarView()
                    navBar.title = "some"

                    guard let titleLabel = navBar.subviews.compactMap({$0 as? UILabel}).first else {
                        fail()
                        return
                    }
                    expect(titleLabel.text).to(equal("some"))
                }
                it("Check that delegate works") {
                    let navBar = AndesCoachMarkNavBarView()
                    let viewDelegateMock = NavBarMock()
                    navBar.delegate = viewDelegateMock
                    navBar.closeButtonTouchUpInside(UIControl(), with: nil)

                    MockSwift.verify(viewDelegateMock)
                }
            }
        }
    }
}

private class NavBarMock: AndesCoachMarkNavBarViewDelegate, Mock {
    var didCalldidClose = MockCounter()

    func didClose() {
        didCalldidClose.wasCalled()
    }

}
