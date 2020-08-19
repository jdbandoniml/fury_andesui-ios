//
//  AndesCoachMarkBodyView.swift
//  CardsComponents
//
//  Created by JONATHAN DANIEL BANDONI on 17/07/2020.
//

protocol AndesCoachMarkBodyViewProtocol: class {
    func setupTextAbove(of positionY: CGFloat)
    func setupTextBelow(of positionY: CGFloat)
    func setupArrowAboveOfTextAndPointToLeft(positionY: CGFloat, width: CGFloat)
    func setupArrowAboveOfTextAndPointToRight(positionY: CGFloat, width: CGFloat)
    func setupArrowBelowOfTextAndPointToLeft(positionY: CGFloat, width: CGFloat)
    func setupArrowBelowOfTextAndPointToRight(positionY: CGFloat, width: CGFloat)

    func setupTitleLabel(title: String)
    func setupDescriptionLabel(description: String)

    func convertCoordinates(view: UIView) -> CGRect

    var width: CGFloat { get }
}

class AndesCoachMarkBodyView: UIView {

    private lazy var labelsContainer = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private var arrowView: AndesCoachMarkArrowView?

    var presenter: AndesCoachMarkBodyPresenter

    let animationDY = CGFloat(16)

    // MARK: - Initialization
    required init(presenter: AndesCoachMarkBodyPresenter) {
        self.presenter = presenter
        super.init(frame: .zero)

        presenter.view = self
        setupViews()
    }

    private func setupViews() {
        labelsContainer.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false

        setupLabelsContainer()
    }

    private func setupLabelsContainer() {
        addSubview(labelsContainer)
        labelsContainer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        labelsContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        presenter.viewLaidOut()
    }

    func show() {
        UIView.animate(withDuration: AndesCoachMarkConstants.Animation.duration, delay: AndesCoachMarkConstants.Animation.delay, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }
            self.alpha = 1
            self.labelsContainer.transform = CGAffineTransform(translationX: 0, y: self.animationDY)
            self.arrowView?.transform = CGAffineTransform(translationX: 0, y: self.animationDY)
        })
    }

    func hide() {
        UIView.animate(withDuration: AndesCoachMarkConstants.Animation.duration, delay: 0, options: .curveEaseIn, animations: { [weak self] in
            guard let self = self else { return }
            self.alpha = 0
            }, completion: { _ in
                self.removeFromSuperview()
        })
    }
}

extension AndesCoachMarkBodyView: AndesCoachMarkBodyViewProtocol {

    var width: CGFloat {
        return frame.width
    }

    func convertCoordinates(view: UIView) -> CGRect {
        return view.convert(view.bounds, to: self)
    }

    func setupTextAbove(of positionY: CGFloat) {
        labelsContainer.bottomAnchor.constraint(equalTo: topAnchor, constant: positionY - animationDY).isActive = true
    }

    func setupTextBelow(of positionY: CGFloat) {
        labelsContainer.topAnchor.constraint(equalTo: topAnchor, constant: positionY - animationDY).isActive = true
    }

    func setupArrowAboveOfTextAndPointToLeft(positionY: CGFloat, width: CGFloat) {
        arrowView = AndesCoachMarkArrowView(width: width, direction: .toUpLeft)
        guard let arrowView = arrowView else { return }

        addSubview(arrowView)
        arrowView.topAnchor.constraint(equalTo: topAnchor, constant: positionY - animationDY).isActive = true
        arrowView.trailingAnchor.constraint(equalTo: labelsContainer.centerXAnchor).isActive = true

        labelsContainer.topAnchor.constraint(equalTo: arrowView.bottomAnchor).isActive = true
    }

    func setupArrowAboveOfTextAndPointToRight(positionY: CGFloat, width: CGFloat) {
        arrowView = AndesCoachMarkArrowView(width: width, direction: .toUpRight)
        guard let arrowView = arrowView else { return }

        addSubview(arrowView)
        arrowView.topAnchor.constraint(equalTo: topAnchor, constant: positionY - animationDY).isActive = true
        arrowView.leadingAnchor.constraint(equalTo: labelsContainer.centerXAnchor).isActive = true

        labelsContainer.topAnchor.constraint(equalTo: arrowView.bottomAnchor).isActive = true
    }

    func setupArrowBelowOfTextAndPointToLeft(positionY: CGFloat, width: CGFloat) {
        arrowView = AndesCoachMarkArrowView(width: width, direction: .toDownLeft)
        guard let arrowView = arrowView else { return }

        addSubview(arrowView)
        arrowView.bottomAnchor.constraint(equalTo: topAnchor, constant: positionY - animationDY).isActive = true
        arrowView.trailingAnchor.constraint(equalTo: labelsContainer.centerXAnchor).isActive = true

        labelsContainer.bottomAnchor.constraint(equalTo: arrowView.topAnchor).isActive = true
    }

    func setupArrowBelowOfTextAndPointToRight(positionY: CGFloat, width: CGFloat) {
        arrowView = AndesCoachMarkArrowView(width: width, direction: .toDownRight)
        guard let arrowView = arrowView else { return }

        addSubview(arrowView)
        arrowView.bottomAnchor.constraint(equalTo: topAnchor, constant: positionY - animationDY).isActive = true
        arrowView.leadingAnchor.constraint(equalTo: labelsContainer.centerXAnchor).isActive = true

        labelsContainer.bottomAnchor.constraint(equalTo: arrowView.topAnchor).isActive = true
    }

    func setupTitleLabel(title: String) {
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.setAndesStyle(style: AndesFontStyle(textColor: AndesStyleSheetManager.styleSheet.textColorWhite, font: AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: AndesFontSize.titleS), sketchLineHeight: 25))
        titleLabel.textAlignment = .center

        labelsContainer.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: labelsContainer.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: labelsContainer.leadingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: labelsContainer.centerXAnchor)
        ])
        titleLabel.sizeToFit()
    }

    func setupDescriptionLabel(description: String) {
        descriptionLabel.text = description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.setAndesStyle(style: AndesFontStyle(textColor: AndesStyleSheetManager.styleSheet.textColorWhite, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyM), sketchLineHeight: 25))
        descriptionLabel.textAlignment = .center

        labelsContainer.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: labelsContainer.leadingAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: labelsContainer.centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: labelsContainer.bottomAnchor, constant: -8)
        ])
        descriptionLabel.sizeToFit()
    }
}
