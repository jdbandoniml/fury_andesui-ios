//
//  CoachmarkRouter.swift
//  AndesUI-demoapp
//
//  Created by JONATHAN DANIEL BANDONI on 06/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit

protocol CoachmarkRouter: NSObject {
    func route(from: UIViewController)
}

class CoachmarkAppRouter: NSObject {
    var view: ButtonsViewController!
}

extension CoachmarkAppRouter: CoachmarkRouter {
    func route(from: UIViewController) {
        view = CoachmarkViewController()
        from.navigationController?.pushViewController(view, animated: true)
    }
}
