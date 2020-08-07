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

        setupCoachmark()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.coachmark?.start()
        }

    }

    private func setupCoachmark() {
        let upLeftStep = AndesCoachMarkStepEntity(highlighted: AndesCoachMarkStepEntity.HighlightedEntity(view: upLeftView, style: .rectangle), title: "Con flecha", description: "Se dibuja la flecha arriba a la izquierda.", nextText: "Siguiente")

        let upRightStep = AndesCoachMarkStepEntity(highlighted: AndesCoachMarkStepEntity.HighlightedEntity(view: upRightView, style: .rectangle), title: "Con flecha", description: "Se dibuja la flecha arriba a la derecha.", nextText: "Siguiente")

        let downLeftStep = AndesCoachMarkStepEntity(highlighted: AndesCoachMarkStepEntity.HighlightedEntity(view: downLeftView, style: .rectangle), title: "Con flecha", description: "Se dibuja la flecha abajo a la izquierda.", nextText: "Siguiente")

        let downRightStep = AndesCoachMarkStepEntity(highlighted: AndesCoachMarkStepEntity.HighlightedEntity(view: downRightView, style: .rectangle), title: "Con flecha", description: "Se dibuja la flecha abajo a la derecha.", nextText: "Siguiente")

        let leftStep = AndesCoachMarkStepEntity(highlighted: AndesCoachMarkStepEntity.HighlightedEntity(view: leftView, style: .rectangle), title: "Con scroll", description: "Es necesario performar un scroll para poder señalar la vista.", nextText: "Siguiente")

        let rightStep = AndesCoachMarkStepEntity(highlighted: AndesCoachMarkStepEntity.HighlightedEntity(view: rightView, style: .rectangle), title: "Con scroll", description: "Es necesario performar un scroll para poder señalar la vista.", nextText: "Siguiente")

        let centerStep = AndesCoachMarkStepEntity(highlighted: AndesCoachMarkStepEntity.HighlightedEntity(view: centerView, style: .rectangle), title: "Sin flecha", description: "No se dibuja flecha porque está centrado.", nextText: "Siguiente")

        let leftCenterStep = AndesCoachMarkStepEntity(highlighted: AndesCoachMarkStepEntity.HighlightedEntity(view: leftCenterView, style: .rectangle), title: "Sin flecha, descentrado", description: "No se dibuja flecha porque no está lo suficientemente desplazado a la izquierda.", nextText: "Siguiente")

        let rightCenterStep = AndesCoachMarkStepEntity(highlighted: AndesCoachMarkStepEntity.HighlightedEntity(view: rightCenterView, style: .rectangle), title: "Sin flecha, descentrado", description: "No se dibuja flecha porque no está lo suficientemente desplazado a la derecha.", nextText: "Terminar")

        let model = AndesCoachMarkEntity(steps: [upLeftStep, upRightStep, downLeftStep, downRightStep, leftStep, rightStep, centerStep, leftCenterStep, rightCenterStep],
                             scrollView: nil,
                             completionHandler: nil)

        coachmark = AndesCoachMarkView(model: model)
    }

}
