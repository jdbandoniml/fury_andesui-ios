//
//  AndesCoachMarkFooterView.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 16/07/2020.
//

import Foundation
import MLUI
import AndesUI
import PureLayout

protocol AndesCoachMarkFooterViewDelegate: class {
    func didNext()
}

class AndesCoachMarkFooterView: UIView {

    var nextText = "" {
        didSet {
            nextButton.text = nextText
        }
    }
    private lazy var nextButton = AndesButton(text: "", hierarchy: .loud, size: .large)
    
    weak var delegate: AndesCoachMarkFooterViewDelegate?
    
    
    // MARK: - Initialization
    required init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    private func setupViews() {
        configureForAutoLayout()
        autoSetDimension(.height, toSize: 96)
        
        setupNextButton()
    }
    
    private func setupNextButton() {
        nextButton.addTarget(self, action: #selector(nextButtonTouchUpInside), for: .touchUpInside)
        
        nextButton.configureForAutoLayout()
        addSubview(nextButton)
        nextButton.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 32, left: 24, bottom: 16, right: 24))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    @objc private func nextButtonTouchUpInside(_ sender: UIControl, with event: UIEvent?) {
        delegate?.didNext()
    }

}
