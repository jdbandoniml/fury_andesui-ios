//
//  AndesCoachmarkHighlightInteractorTests.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 10/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesCoachmarkHighlightInteractorTests: QuickSpec {
    override func spec() {
        let label: UILabel = {
            let label = UILabel()
            label.backgroundColor = .white
            label.textColor = .black
            return label
        }()

        let button: UIButton = {
            let button = UIButton(type: .system)
            button.backgroundColor = .blue
            return button
        }()

        let interactor = AndesCoachMarkHighlightInteractor(overlayView: <#T##UIView#>, view: <#T##UIView#>, bodyViewBounds: <#T##CGRect#>, style: <#T##AndesCoachMarkStepEntity.HighlightedEntity.Style#>)

        describe("Coachmark Highlight Interactor Tests") {
            context("set highlight") {

                beforeEach {
                    colorService.setHighlight()
                }

                it("should change label color") {
                    expect(label.textColor).to(equal(.white))
                }
                it("should change the views background color") {
                    expect(button.backgroundColor).to(equal(UIColor(red: 0, green: 0, blue: 0.0625, alpha: 1)))
                    expect(label.backgroundColor).to(equal(UIColor(red: 0.0625, green: 0.0625, blue: 0.0625, alpha: 1)))
                }
            }
            context("clear highlight") {
                beforeEach {
                    colorService.setHighlight()
                    colorService.clearHighlight()
                }

                it("should change label color") {
                    expect(label.textColor).to(equal(.black))
                }
                it("should change the views background color") {
                    expect(button.backgroundColor).to(equal(.blue))
                    expect(label.backgroundColor).to(equal(.white))
                }
            }
        }
    }

}
