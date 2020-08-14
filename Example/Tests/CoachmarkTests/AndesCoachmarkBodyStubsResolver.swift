//
//  AndesCoachmarkBodyStubsResolver.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 13/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

@testable import AndesUI

class AndesCoachmarkBodyStubsResolver {

    var model: AndesCoachMarkBodyEntity!
    private let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    private let centerView = UIView(frame: CGRect(x: 65, y: 65, width: 20, height: 20))
    private let centerRightView = UIView(frame: CGRect(x: 75, y: 0, width: 20, height: 20))
    private let centerLeftView = UIView(frame: CGRect(x: 55, y: 0, width: 20, height: 20))
    private let leftBelowView = UIView(frame: CGRect(x: 0, y: 130, width: 20, height: 20))
    private let rightBelowView = UIView(frame: CGRect(x: 130, y: 130, width: 20, height: 20))
    private let leftAboveView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    private let rightAboveView = UIView(frame: CGRect(x: 130, y: 0, width: 20, height: 20))

    enum StubsType {
        case centerAboveView
        case centerRightAboveView
        case centerLeftBelowView
        case rightBelowView
        case leftBelowView
        case rightAboveView
        case leftAboveView
    }

    init(_ type: StubsType) {
        setupMainView()

        switch type {
        case .centerAboveView:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: centerView, position: .above)
        case .centerRightAboveView:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: centerRightView, position: .above)
        case .centerLeftBelowView:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: centerLeftView, position: .below)
        case .rightBelowView:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: rightBelowView, position: .above)
        case .leftBelowView:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: leftBelowView, position: .above)
        case .rightAboveView:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: rightAboveView, position: .below)
        case .leftAboveView:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: leftAboveView, position: .below)
        }
    }

    private func setupMainView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false

        mainView.addSubview(centerView)
        mainView.addSubview(leftBelowView)
        mainView.addSubview(rightBelowView)
        mainView.addSubview(leftAboveView)
        mainView.addSubview(rightAboveView)
        mainView.addSubview(centerRightView)
        mainView.addSubview(centerLeftView)
    }
}
