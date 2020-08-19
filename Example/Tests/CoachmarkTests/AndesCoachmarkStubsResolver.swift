//
//  AndesCoachmarkStubsResolver.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 12/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

@testable import AndesUI

class AndesCoachmarkStubsResolver {

    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    let bodyView: UIView = {
        let view = UIView(frame: CGRect(x: 12, y: 30, width: 100, height: 100))
        let subview = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.addSubview(subview)
        return view
    }()
    let overlayView: UIView
    var model: AndesCoachMarkEntity!
    lazy var mainView = createMainView()

    enum StubsType {
        case oneStep
        case twoSteps
    }

    init(_ type: StubsType) {
        overlayView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        overlayView.addSubview(bodyView)

        switch type {
        case .oneStep:
            model = oneStep()
        case .twoSteps:
            model = twoSteps()
        }
    }

    private func oneStep() -> AndesCoachMarkEntity {
        let step = AndesCoachMarkStepEntity(title: "some title",
                                            description: "some description",
                                            view: mainView.subviews[0],
                                            style: .rectangle,
                                            nextText: "Next")

        return AndesCoachMarkEntity(steps: [step], scrollView: scrollView, completionHandler: nil)
    }

    private func twoSteps() -> AndesCoachMarkEntity {
        let firstStep = AndesCoachMarkStepEntity(title: "Some title",
                                                 description: "Some description",
                                                 view: mainView.subviews[0],
                                                 style: .rectangle,
                                                 nextText: "Next")

        let secondStep = AndesCoachMarkStepEntity(title: "Some another title",
                                                  description: "Some another description",
                                                  view: mainView.subviews[1],
                                                  style: .rectangle,
                                                  nextText: "Got it")

        return AndesCoachMarkEntity(steps: [firstStep, secondStep], scrollView: scrollView, completionHandler: nil)
    }

    private func createMainView() -> UIView {
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
