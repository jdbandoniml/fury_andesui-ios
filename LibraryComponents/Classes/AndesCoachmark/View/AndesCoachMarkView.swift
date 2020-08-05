//
//  AndesCoachMarkView.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 16/04/2020.
//

import UIKit
import PureLayout
import MLUI

public class AndesCoachMarkView: UIView {
    let overlayLayer = CAShapeLayer()
    let maskLayer = CAShapeLayer()
    
    public weak var delegate: CECoachMarkViewDelegate?
    public let overlayColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.80)
    
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
    var presenter: AndesCoachMarkPresenter
    
    var mustStart = false
    
    var animated: Bool {
        get {
            return self.presenter.animated
        }
    }

    // MARK: - Initialization
    public init(model: AndesCoachMarkEntity) {
        self.presenter = AndesCoachMarkPresenter(model: model)
        
        super.init(frame: CGRect.zero)
        
        //TODO: Llevar a presenter, getCurrentWindows
        guard let window = presenter.getWindow() else { return }
        window.addSubview(self)
        
        setupViews()
        setupOverlayLayer()
        layoutIfNeeded()
    }
    
    private func setupViews() {
        alpha = 0.0
        presenter.view = self
        configureForAutoLayout()
        autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        
        //TODO: LLevar a presenter, getStatusBarHeight
        let height = UIApplication.shared.statusBarFrame.size.height
        autoPinEdge(toSuperviewEdge: .top, withInset: height)
        
        addSubview(navBar)
        navBar.autoPinEdge(toSuperviewEdge: .top)
        navBar.autoPinEdge(toSuperviewEdge: .leading)
        navBar.autoPinEdge(toSuperviewEdge: .trailing)
        
        addSubview(footer)
        footer.autoPinEdge(toSuperviewEdge: .bottom)
        footer.autoPinEdge(toSuperviewEdge: .leading)
        footer.autoPinEdge(toSuperviewEdge: .trailing)
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
        mustStart = true
        setNeedsLayout()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if mustStart {
            mustStart = false
            presenter.start()
        }
        
    }

}

//MARK: - Actions from  NavBar
extension AndesCoachMarkView: AndesCoachMarkNavBarViewDelegate {
    func didClose() {
        presenter.didCloseButtonTap()
    }
}

//MARK: - Actions from Footer
extension AndesCoachMarkView: AndesCoachMarkFooterViewDelegate {
    func didNext() {
        presenter.didNextActionTap()
    }
}
