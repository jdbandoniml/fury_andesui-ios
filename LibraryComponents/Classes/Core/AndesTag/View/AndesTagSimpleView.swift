//
//  AndesTagSimpleView.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/28/20.
//

import Foundation

class AndesTagSimpleView: AndesTagAbstractView {

    @IBOutlet weak var leftContentWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftContentViewContainer: UIView!

    var leftContentView: UIView?

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTagSimpleView", owner: self, options: nil)
    }

    override func updateView() {
        self.backgroundColor = config.backgroundColor
        self.layer.borderColor = config.borderColor.cgColor
        self.layer.borderWidth = 1.2
        self.heightConstraint.constant = config.height ?? 24
        self.layer.cornerRadius = config.cornerRadius ?? 12
        textLabel.text = config.text
        textLabel.font = config.textFont
        textLabel.textColor = config.textColor

        setupDismissButton()
        updateLeftContentView()
    }

    func setupDismissButton() {
        if config.isDismissable {
            AndesIconsProvider.loadIcon(name: "andes_ui_close_16") { dismissImage in
                self.rightButton.setImage(dismissImage, for: .normal)
            }
            self.rightButton.tintColor = config.buttonColor
            self.trailingConstraint.constant = 0
            self.rightButton.accessibilityLabel = "Cerrar".localized()
        } else {
            self.trailingConstraint.constant = config.horizontalPadding ?? 0
        }
        self.rightButtonWidthConstraint.constant = config.rightButtonWidth
    }

    func updateLeftContentView() {
        if let leftContent = config.leftContent {
            self.leftContentWidthConstraint.constant = 36
            self.leadingConstraint.constant = 0
            self.leftContentView?.removeFromSuperview()
            self.leftContentView = AndesTagLeftContentFactory.generateLeftContentView(for: leftContent)

            if let leftContentView = self.leftContentView {
                self.leftContentViewContainer.addSubview(leftContentView)
                leftContentView.pinToSuperview(top: 4, left: 4, bottom: -4, right: 8)
                leftContentView.layer.cornerRadius = 12
                leftContentView.clipsToBounds = true
            }
        } else {
            self.leftContentView?.removeFromSuperview()
            self.leftContentWidthConstraint.constant = 0
            self.leadingConstraint.constant = config.horizontalPadding ?? 0
        }
    }

    override func rightButtonTapped(_ sender: Any) {
        self.delegate?.didTapDismiss()
    }
}
