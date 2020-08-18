//
//  AndesCoachmarkFooterTests.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 18/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesCoachmarkFooterTests: QuickSpec {
    override func spec() {

        describe("Coachmark footer tests") {
            context("Next button") {
                it("Check that title was setted correctly") {
                    let footer = AndesCoachMarkFooterView()
                    footer.nextText = "Next"

                    guard let nextButton = footer.subviews.compactMap({$0 as? AndesButton}).first else {
                        fail()
                        return
                    }
                    expect(nextButton.text).to(equal("Next"))
                }
                it("Check that delegate works") {
                    let footer = AndesCoachMarkFooterView()
                    let viewDelegateMock = FooterMock()
                    footer.delegate = viewDelegateMock
                    footer.nextButtonTouchUpInside(UIControl(), with: nil)

                    MockSwift.verify(viewDelegateMock)
                }
            }
        }
    }
}

private class FooterMock: AndesCoachMarkFooterViewDelegate, Mock {
    var didCalldidNext = MockCounter()

    func didNext() {
        didCalldidNext.wasCalled()
    }
}
