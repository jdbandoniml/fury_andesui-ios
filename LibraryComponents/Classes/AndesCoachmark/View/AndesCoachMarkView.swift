//
//  AndesCoachMarkView.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 16/04/2020.
//

import UIKit

public class AndesCoachMarkView: UIView {
    let overlayLayer = CAShapeLayer()
    let maskLayer = CAShapeLayer()

    public weak var delegate: AndesCoachMarkViewDelegate?
    public let overlayColor: UIColor = UIColor.Andes.gray800

    var highlightedView: AndesCoachMarkHighlightedView?

    lazy var navBar: AndesCoachMarkNavBarView = {
        let navBar = AndesCoachMarkNavBarView()
        navBar.alpha = 0
        navBar.delegate = self
        return navBar
    }()
    lazy var footer: AndesCoachMarkFooterView = {
        let footer = AndesCoachMarkFooterView()
        footer.alpha = 0
        footer.delegate = self
        return footer
    }()
    var body: AndesCoachMarkBodyView?
    private var presenter: AndesCoachMarkPresenter

    var animated: Bool {
        get {
            return self.presenter.animated
        }
    }

    var onExit: (() -> Void)?

    // MARK: - Initialization
    public init(model: AndesCoachMarkEntity) {
        self.onExit = model.completionHandler
        self.presenter = AndesCoachMarkPresenter(model: model)

        super.init(frame: CGRect.zero)

        setupViews()
        setupOverlayLayer()
        layoutIfNeeded()
    }

    private func setupViews() {
        alpha = 0.0
        presenter.view = self
        translatesAutoresizingMaskIntoConstraints = false

        guard let window = presenter.getWindow() else { return }

        window.addSubview(self)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: window.leadingAnchor),
            trailingAnchor.constraint(equalTo: window.trailingAnchor),
            bottomAnchor.constraint(equalTo: window.bottomAnchor),
            topAnchor.constraint(equalTo: window.topAnchor)
        ])

        addSubview(navBar)
        NSLayoutConstraint.activate([
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBar.topAnchor.constraint(equalTo: topAnchor, constant: presenter.getStatusBarHeight())
        ])

        addSubview(footer)
        NSLayoutConstraint.activate([
            footer.leadingAnchor.constraint(equalTo: leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        if #available(iOS 11.0, *) {
            footer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            footer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
    }

    private func setupOverlayLayer() {
        overlayLayer.backgroundColor = self.overlayColor.cgColor
        overlayLayer.frame = UIScreen.main.bounds

        maskLayer.frame = overlayLayer.bounds
        maskLayer.fillColor = UIColor.black.cgColor
        maskLayer.fillRule = .evenOdd
        overlayLayer.mask = maskLayer
        layer.addSublayer(overlayLayer)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    public func start() {
        presenter.start()
    }

}

// MARK: - Actions from NavBar
extension AndesCoachMarkView: AndesCoachMarkNavBarViewDelegate {
    func didClose() {
        presenter.didCloseButtonTap()
    }
}

// MARK: - Actions from Footer
extension AndesCoachMarkView: AndesCoachMarkFooterViewDelegate {
    func didNext() {
        presenter.didNextActionTap()
    }
}
