//
//  AndesCoachMarkFooterView.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 16/07/2020.
//

import Foundation

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
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 96).isActive = true

        setupNextButton()
    }

    private func setupNextButton() {
        nextButton.addTarget(self, action: #selector(nextButtonTouchUpInside), for: .touchUpInside)

        nextButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            nextButton.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 24),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    @objc private func nextButtonTouchUpInside(_ sender: UIControl, with event: UIEvent?) {
        delegate?.didNext()
    }

}
