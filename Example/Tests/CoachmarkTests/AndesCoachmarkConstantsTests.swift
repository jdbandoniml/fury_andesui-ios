//
//  AndesCoachmarkConstantsTests.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 11/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesCoachmarkConstantsTests: QuickSpec {
    override func spec() {

        describe("Coachmark Constants Tests") {
            context("Arrow") {
                it("Check that constant values have not changed") {
                    expect(AndesCoachMarkConstants.Arrow.radius).to(equal(20))
                    expect(AndesCoachMarkConstants.Arrow.headHeight).to(equal(8.6))
                    expect(AndesCoachMarkConstants.Arrow.headWidth).to(equal(5))
                    expect(AndesCoachMarkConstants.Arrow.correction).to(equal(0.5))
                    expect(AndesCoachMarkConstants.Arrow.downRotation).to(equal(CGFloat.pi*11/12))
                    expect(AndesCoachMarkConstants.Arrow.upRotation).to(equal(CGFloat.pi/12))
                }
            }
            context("Animation") {
                it("Check that constant values have not changed") {
                    expect(AndesCoachMarkConstants.Animation.duration).to(equal(0.25))
                    expect(AndesCoachMarkConstants.Animation.delay).to(equal(0.1))
                }
            }
            context("Highlight") {
                it("Check that constant values have not changed") {
                    expect(AndesCoachMarkConstants.Highlight.margin).to(equal(12))
                    expect(AndesCoachMarkConstants.Highlight.borderMargin).to(equal(1))
                    expect(AndesCoachMarkConstants.Highlight.borderWidth).to(equal(3))
                    expect(AndesCoachMarkConstants.Highlight.cornerRadius).to(equal(8))
                }
            }
        }
    }

}
