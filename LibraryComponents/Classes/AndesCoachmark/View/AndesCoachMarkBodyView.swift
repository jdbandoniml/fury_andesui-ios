//
//  AndesCoachMarkBodyView.swift
//  CardsComponents
//
//  Created by JONATHAN DANIEL BANDONI on 17/07/2020.
//

import Foundation
import MLUI
import AndesUI
import PureLayout

protocol AndesCoachMarkBodyViewProtocol: class {
    func setupTextAbove(of y: CGFloat)
    func setupTextBelow(of y: CGFloat)
    func setupArrowAboveOfTextAndPointToLeft(y: CGFloat, width: CGFloat)
    func setupArrowAboveOfTextAndPointToRight(y: CGFloat, width: CGFloat)
    func setupArrowBelowOfTextAndPointToLeft(y: CGFloat, width: CGFloat)
    func setupArrowBelowOfTextAndPointToRight(y: CGFloat, width: CGFloat)
    
    func setupTitleLabel(title: String)
    func setupDescriptionLabel(description: String)
    
    func convertCoordinates(view: UIView) -> CGRect
    
    var width: CGFloat { get }
}

class AndesCoachMarkBodyView: UIView {
    
    private lazy var labelsContainer = UIView(forAutoLayout: ())
    private lazy var titleLabel = UILabel(forAutoLayout: ())
    private lazy var descriptionLabel = UILabel(forAutoLayout: ())
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
        configureForAutoLayout()
        
        setupLabelsContainer()
    }
    
    private func setupLabelsContainer() {
        addSubview(labelsContainer)
        labelsContainer.autoAlignAxis(toSuperviewAxis: .vertical)
        labelsContainer.autoPinEdge(toSuperviewEdge: .leading)
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
    
    func setupTextAbove(of y: CGFloat) {
        labelsContainer.autoPinEdge(.bottom, to: .top, of: self, withOffset: y - animationDY)
        
    }
    
    func setupTextBelow(of y: CGFloat) {
        labelsContainer.autoPinEdge(toSuperviewEdge: .top, withInset: y - animationDY)
    }
    
    
    func setupArrowAboveOfTextAndPointToLeft(y: CGFloat, width: CGFloat) {
        arrowView = AndesCoachMarkArrowView(width: width, direction: .toUpLeft)
        guard let arrowView = arrowView else { return }
        
        addSubview(arrowView)
        arrowView.autoPinEdge(toSuperviewEdge: .top, withInset: y - animationDY)
        arrowView.trailingAnchor.constraint(equalTo: labelsContainer.centerXAnchor).isActive = true      //I can't do this with PureLayout
        
        labelsContainer.autoPinEdge(.top, to: .bottom, of: arrowView)
    }
    
    func setupArrowAboveOfTextAndPointToRight(y: CGFloat, width: CGFloat) {
        arrowView = AndesCoachMarkArrowView(width: width, direction: .toUpRight)
        guard let arrowView = arrowView else { return }
        
        addSubview(arrowView)
        arrowView.autoPinEdge(toSuperviewEdge: .top, withInset: y - animationDY)
        arrowView.leadingAnchor.constraint(equalTo: labelsContainer.centerXAnchor).isActive = true      //I can't do this with PureLayout
        
        labelsContainer.autoPinEdge(.top, to: .bottom, of: arrowView)
    }
    
    func setupArrowBelowOfTextAndPointToLeft(y: CGFloat, width: CGFloat) {
        arrowView = AndesCoachMarkArrowView(width: width, direction: .toDownLeft)
        guard let arrowView = arrowView else { return }
        
        addSubview(arrowView)
        arrowView.autoPinEdge(toSuperviewEdge: .bottom, withInset: y - animationDY)
        arrowView.trailingAnchor.constraint(equalTo: labelsContainer.centerXAnchor).isActive = true      //I can't do this with PureLayout
        
        labelsContainer.autoPinEdge(.bottom, to: .top, of: arrowView)
    }
    
    func setupArrowBelowOfTextAndPointToRight(y: CGFloat, width: CGFloat) {
        arrowView = AndesCoachMarkArrowView(width: width, direction: .toDownRight)
        guard let arrowView = arrowView else { return }
        
        addSubview(arrowView)
        arrowView.autoPinEdge(.bottom, to: .top, of: self, withOffset: y - animationDY)
        arrowView.leadingAnchor.constraint(equalTo: labelsContainer.centerXAnchor).isActive = true      //I can't do this with PureLayout
        
        labelsContainer.autoPinEdge(.bottom, to: .top, of: arrowView)
    }
    
    func setupTitleLabel(title: String) {
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.ml_semiboldSystemFont(ofSize: CGFloat(kMLFontsSizeLarge))
        titleLabel.textColor = MLStyleSheetManager.styleSheet.whiteColor
        titleLabel.textAlignment = .center
        titleLabel.addLineHeight(25)
        
        labelsContainer.addSubview(titleLabel)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        titleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0, relation: .greaterThanOrEqual)
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        titleLabel.sizeToFit()
    }
    
    func setupDescriptionLabel(description: String) {
        descriptionLabel.text = description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.ml_regularSystemFont(ofSize: CGFloat(kMLFontsSizeSmall))
        descriptionLabel.textColor = MLStyleSheetManager.styleSheet.whiteColor
        descriptionLabel.textAlignment = .center
        descriptionLabel.addLineHeight(20)
        
        labelsContainer.addSubview(descriptionLabel)
        descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 4)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0, relation: .greaterThanOrEqual)
        descriptionLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
        descriptionLabel.sizeToFit()
    }
}
