//
//  AndesCoachMarkNavBarView.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 16/07/2020.
//

import Foundation
import MLUI
import PureLayout

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
    private lazy var titleLabel = UILabel(forAutoLayout: ())
    
    weak var delegate: AndesCoachMarkNavBarViewDelegate?
    
    
    // MARK: - Initialization
    required init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    private func setupViews() {
        configureForAutoLayout()
        autoSetDimension(.height, toSize: 64)
        
        setupCloseButton()
        setupTitle()
    }
    
    private func setupCloseButton() {
        closeButton.addTarget(self, action: #selector(closeButtonTouchUpInside(_:with:)), for: .touchUpInside)
        closeButton.setImage(CEBundle.imageNamed(ImageNameConstants.close), for: .normal)
        closeButton.tintColor = MLStyleSheetManager.styleSheet.whiteColor
        
        closeButton.configureForAutoLayout()
        addSubview(closeButton)
        closeButton.autoSetDimensions(to: CGSize(width: 16, height: 16))
        closeButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        closeButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 24)
    }
    
    private func setupTitle() {
        titleLabel.addLineHeight(18)
        titleLabel.font = UIFont.ml_regularSystemFont(ofSize: CGFloat(kMLFontsSizeXSmall))
        titleLabel.textColor = MLStyleSheetManager.styleSheet.whiteColor
        
        addSubview(titleLabel)
        titleLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        titleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 24)
        titleLabel.autoPinEdge(.trailing, to: .leading, of: closeButton, withOffset: -24, relation: .lessThanOrEqual)
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
