//
//  AndesCoachMarkNavBarView.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 16/07/2020.
//

import Foundation

protocol AndesCoachMarkNavBarViewDelegate: class {
    func didClose()
}

class AndesCoachMarkNavBarView: UIView {

    var title = "" {
        didSet {
             titleLabel.text = title
        }
    }
    private lazy var closeButton = UIButton(type: .system)
    private lazy var titleLabel = UILabel()

    weak var delegate: AndesCoachMarkNavBarViewDelegate?

    // MARK: - Initialization
    required init() {
        super.init(frame: .zero)

        setupViews()
    }

    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 64).isActive = true

        setupCloseButton()
        setupTitle()
    }

    private func setupCloseButton() {
        closeButton.addTarget(self, action: #selector(closeButtonTouchUpInside(_:with:)), for: .touchUpInside)
        closeButton.setImage(AndesBundle.imageNamed(ImageNameConstants.close), for: .normal)
        closeButton.tintColor = AndesStyleSheetManager.styleSheet.textColorWhite

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 16),
            closeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])

    }

    private func setupTitle() {
        titleLabel.setAndesStyle(style: AndesFontStyle(textColor: AndesStyleSheetManager.styleSheet.textColorWhite, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyM), sketchLineHeight: 18))

        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: closeButton.leadingAnchor, constant: -24)
        ])

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    @objc private func closeButtonTouchUpInside(_ sender: UIControl, with event: UIEvent?) {
        delegate?.didClose()
    }

}

private extension AndesCoachMarkNavBarView {
    enum ImageNameConstants {
        static let close = "coachmark_close"
    }
}
