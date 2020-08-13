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
    private let centerView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    private let centerRightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    private let centerLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    private let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    private let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))

    enum StubsType {
        case centerViewAbove
        case centerRightViewAbove
        case centerLeftViewBelow
        case rightViewBelow
        case leftViewBelow
    }

    init(_ type: StubsType) {
        setupMainView()

        switch type {
        case .centerViewAbove:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: centerView, position: .above)
        case .centerRightViewAbove:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: centerRightView, position: .above)
        case .centerLeftViewBelow:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: centerLeftView, position: .below)
        case .rightViewBelow:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: rightView, position: .below)
        case .leftViewBelow:
            model = AndesCoachMarkBodyEntity(title: "title", description: "description", viewToPoint: leftView, position: .below)
        }
    }

    private func setupMainView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false

        mainView.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        centerView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true

        mainView.addSubview(leftView)
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        leftView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true

        mainView.addSubview(rightView)
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        rightView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true

        mainView.addSubview(centerRightView)
        centerRightView.translatesAutoresizingMaskIntoConstraints = false
        centerRightView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        centerRightView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 20).isActive = true

        mainView.addSubview(centerLeftView)
        centerLeftView.translatesAutoresizingMaskIntoConstraints = false
        centerLeftView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        centerLeftView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: -20).isActive = true
    }
}
