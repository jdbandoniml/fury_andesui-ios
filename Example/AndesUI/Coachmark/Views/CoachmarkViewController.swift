//
//  CoachmarkViewController.swift
//  AndesUI-demoapp
//
//  Created by JONATHAN DANIEL BANDONI on 06/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

class CoachmarkViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var upLeftView: UIView!
    @IBOutlet weak var upRightView: UIView!
    @IBOutlet weak var downLeftView: UIView!
    @IBOutlet weak var downRightView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var leftCenterView: UIView!
    @IBOutlet weak var rightCenterView: UIView!

    var coachmark: And

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCoachmark()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    private func setupCoachmark() {

    }

}
