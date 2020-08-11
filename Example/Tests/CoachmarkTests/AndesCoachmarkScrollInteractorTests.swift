//
//  AndesCoachmarkScrollInteractorTests.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 11/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesCoachmarkScrollInteractorTests: QuickSpec {
    override func spec() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let bodyView: UIView = {
            let view = UIView(frame: CGRect(x: 12, y: 30, width: 100, height: 100))
            let subview = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            view.addSubview(subview)
            return view
        }()
        let mainView = createMainView()
        var scrollInteractor: AndesCoachMarkScrollInteractor!

        var completionBlockPerformed = false
        let completionBlock = {
            completionBlockPerformed = true
        }

        describe("Coachmark Scroll Interactor Tests") {
            beforeEach {
                completionBlockPerformed = false
                scrollView.contentOffset = .zero
            }

            context("check scrolling") {
                it("should scroll because it need it") {
                    scrollInteractor = AndesCoachMarkScrollInteractor(mainView.subviews[0], scrollView: scrollView, bodyView: bodyView, animated: false)
                    expect(scrollInteractor.isScrollNeeded()).to(beTrue())

                    scrollInteractor.scrollIfNeeded()
                    expect(scrollView.contentOffset).to(equal(CGPoint(x: 0, y: -46)))
                }
                it("should not scroll because it doesn't need it") {
                    scrollInteractor = AndesCoachMarkScrollInteractor(mainView.subviews[1], scrollView: scrollView, bodyView: bodyView, animated: false)
                    expect(scrollInteractor.isScrollNeeded()).to(beFalse())

                    scrollInteractor.scrollIfNeeded()
                    expect(scrollView.contentOffset).to(equal(CGPoint.zero))
                }
                it("should not scroll because bodyview doesn't have subviews") {
                    scrollInteractor = AndesCoachMarkScrollInteractor(mainView.subviews[1], scrollView: scrollView, bodyView: UIView(), animated: false)
                    expect(scrollInteractor.isScrollNeeded()).to(beFalse())

                    scrollInteractor.scrollIfNeeded()
                    expect(scrollView.contentOffset).to(equal(CGPoint.zero))
                }
                it("should perform completion block") {
                    scrollInteractor = AndesCoachMarkScrollInteractor(mainView.subviews[2], scrollView: scrollView, bodyView: bodyView, animated: false)
                    scrollInteractor.scrollIfNeeded(completion: completionBlock)
                    expect(completionBlockPerformed).to(beTrue())
                }
            }
            context("check restore function") {
                beforeEach {
                    completionBlockPerformed = false
                    scrollView.contentOffset = .zero
                }

                it("should restore scroll when it scrolled") {
                    scrollInteractor = AndesCoachMarkScrollInteractor(mainView.subviews[2], scrollView: scrollView, bodyView: bodyView, animated: false)
                    scrollInteractor.scrollIfNeeded()
                    expect(scrollInteractor.restore()).to(beTrue())
                    expect(scrollView.contentOffset).to(equal(.zero))
                }
                it("should restore scroll when it didn't scroll") {
                    scrollInteractor = AndesCoachMarkScrollInteractor(mainView.subviews[1], scrollView: scrollView, bodyView: bodyView, animated: false)
                    expect(scrollInteractor.isScrollNeeded()).to(beFalse())
                    scrollInteractor.scrollIfNeeded()
                    expect(scrollInteractor.restore()).to(beFalse())
                    expect(scrollView.contentOffset).to(equal(.zero))
                }
                it("should perform completion block") {
                    scrollInteractor = AndesCoachMarkScrollInteractor(mainView.subviews[0], scrollView: scrollView, bodyView: bodyView, animated: false)
                    scrollInteractor.scrollIfNeeded()
                    expect(scrollInteractor.restore(completion: completionBlock)).to(beTrue())
                    expect(completionBlockPerformed).to(beTrue())
                }
            }
        }
    }

    func createMainView() -> UIView {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let secondView = UIView(frame: CGRect(x: 0, y: 35, width: 20, height: 20))
        let thirdView = UIView(frame: CGRect(x: 0, y: 60, width: 100, height: 100))

        mainView.addSubview(firstView)
        mainView.addSubview(secondView)
        mainView.addSubview(thirdView)
        return mainView
    }
}
