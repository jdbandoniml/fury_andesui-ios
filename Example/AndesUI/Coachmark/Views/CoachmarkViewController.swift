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

    var coachmark: AndesCoachMarkView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupCoachmark()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.coachmark?.start()
        }
    }

    private func setupViews() {
        centerView.layer.cornerRadius = centerView.bounds.height/2
    }

    private func setupCoachmark() {
        let upLeftStep = AndesCoachMarkStepEntity(title: "Con flecha", description: "Se dibuja la flecha arriba a la izquierda.", view: upLeftView, style: .rectangle, nextText: "Siguiente")

        let upRightStep = AndesCoachMarkStepEntity(title: "Con flecha", description: "Se dibuja la flecha arriba a la derecha.", view: upRightView, style: .rectangle, nextText: "Siguiente")

        let downLeftStep = AndesCoachMarkStepEntity(title: "Con flecha", description: "Se dibuja la flecha abajo a la izquierda.", view: downLeftView, style: .rectangle, nextText: "Siguiente")

        let downRightStep = AndesCoachMarkStepEntity(title: "Con flecha", description: "Se dibuja la flecha abajo a la derecha.", view: downRightView, style: .rectangle, nextText: "Siguiente")

        let leftStep = AndesCoachMarkStepEntity(title: "Con scroll", description: "Es necesario performar un scroll para poder señalar la vista.", view: leftView, style: .rectangle, nextText: "Siguiente")

        let rightStep = AndesCoachMarkStepEntity(title: "Con scroll", description: "Es necesario performar un scroll para poder señalar la vista.", view: rightView, style: .rectangle, nextText: "Siguiente")

        let centerStep = AndesCoachMarkStepEntity(title: "Sin flecha", description: "No se dibuja flecha porque está centrado.", view: centerView, style: .circle, nextText: "Siguiente")

        let leftCenterStep = AndesCoachMarkStepEntity(title: "Sin flecha, descentrado", description: "No se dibuja flecha porque no está lo suficientemente desplazado a la izquierda.", view: leftCenterView, style: .rectangle, nextText: "Siguiente")

        let rightCenterStep = AndesCoachMarkStepEntity(title: "Sin flecha, descentrado", description: "No se dibuja flecha porque no está lo suficientemente desplazado a la derecha.", view: rightCenterView, style: .rectangle, nextText: "Terminar")

        let model = AndesCoachMarkEntity(steps: [upLeftStep, upRightStep, downLeftStep, downRightStep, leftStep, rightStep, centerStep, leftCenterStep, rightCenterStep],
                             scrollView: scrollView,
                             completionHandler: nil)

        coachmark = AndesCoachMarkView(model: model)
    }

}
