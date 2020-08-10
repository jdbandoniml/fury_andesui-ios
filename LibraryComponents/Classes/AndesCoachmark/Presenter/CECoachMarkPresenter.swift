//
//  AndesCoachMarkPresenter.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 16/04/2020.
//

import UIKit

class AndesCoachMarkPresenter {
    var model: AndesCoachMarkEntity
    weak var view: AndesCoachMarkViewProtocol?

    var currentIndex = -1
    var animated = true

    private var currentStep: AndesCoachMarkStepEntity? {
        if currentIndex < 0 { return nil }
        return model.steps[currentIndex]
    }

    private var scrollInteractor: AndesCoachMarkScrollInteractor?
    private var highlightInteractor: AndesCoachMarkHighlightInteractorProtocol?

    required init(model: AndesCoachMarkEntity, animated: Bool = true) {
        self.model = model
        self.animated = animated
    }

    private func createScrollInteractor() {
        guard let view = view,
            let scrollView = model.scrollView,
            let highlighted = currentStep?.highlighted,
            let bodyView = view.bodyView else {
                scrollInteractor = nil
                return
        }
        scrollInteractor = AndesCoachMarkScrollInteractor(highlighted.view, scrollView: scrollView, bodyView: bodyView, animated: animated)

    }

    private func createHighlightInteractor() {
        guard let view = view,
            let highlighted = currentStep?.highlighted,
            let bodyView = view.bodyView,
            let overlayView = bodyView.superview else {
                highlightInteractor = nil
                return
        }
        highlightInteractor = AndesCoachMarkHighlightInteractor(overlayView: overlayView, view: highlighted.view, bodyViewBounds: bodyView.convert(bodyView.bounds, to: overlayView), style: highlighted.style)

    }

    private func restore(completion: (() -> Void)? = nil) {
        guard let scrollInteractor = scrollInteractor else {
            completion?()
            return
        }
        if scrollInteractor.restore(completion: completion) {
            view?.removeHighlight()
            hide()
        }
    }

    private func setBody(_ position: AndesCoachMarkBodyEntity.Position, removePrevious: Bool) {
        guard let view = view, let currentStep = currentStep else { return }
        view.setBody(AndesCoachMarkBodyPresenter(model: AndesCoachMarkBodyEntity(title: currentStep.title,
                                                                           description: currentStep.description,
                                                                           viewToPoint: currentStep.highlighted.view,
                                                                           position: position)), removePrevious: removePrevious)
    }

    private func prepare() {
        guard let view = view, let currentStep = currentStep else { return }

        createHighlightInteractor()
        let bodyPosition: AndesCoachMarkBodyEntity.Position = highlightInteractor?.isHighlightedViewBelow() ?? true ? .above : .below

        view.setNavBar("\(currentIndex+1) de \(model.steps.count)")
        view.setFooter(currentStep.nextText)
        view.hideBody()
        setBody(bodyPosition, removePrevious: false)
        createScrollInteractor()

        //If it needs scroll, it will be performed
        //This 'if let' line is here because scrollInteractor is a new instance!
        if let scrollInteractor = scrollInteractor, scrollInteractor.isScrollNeeded() {
            view.removeHighlight()
            hide()
        } else {
            show()
            return
        }
        _ = scrollInteractor?.scrollIfNeeded { [weak self] in
            self?.setBody(bodyPosition, removePrevious: true)
            self?.show()
        }

    }

    private func showNext() {
        if currentIndex == model.steps.count - 1 {
            exit()
            return
        }

        self.currentIndex += 1
        prepare()
    }

    private func show() {
        createHighlightInteractor()
        guard let view = view, let highlightInteractor = highlightInteractor else { return }

        view.setHighlight(frame: highlightInteractor.getHighlightRect(), cornerRadius: highlightInteractor.getHighlightCornerRadius(), maskPath: highlightInteractor.getMaskPath())
        view.show()
    }

    private func hide() {
        view?.hide()
    }

    private func exit() {
        restore { [weak self] in
            self?.view?.exit()
        }
    }

    func start() {
        if currentIndex != -1 { return }

        currentIndex = 0
        setBody(.above, removePrevious: true)
        prepare()
    }

    func getWindow() -> UIWindow? {
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.last
    }

    func getStatusBarHeight() -> CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
}

// MARK: - Actions from view
extension AndesCoachMarkPresenter {

    func didNextActionTap() {
        view?.showNext(stepIndex: self.currentIndex)
        showNext()
    }

    func didCloseButtonTap() {
        view?.close(stepIndex: self.currentIndex)
        exit()
    }

}
