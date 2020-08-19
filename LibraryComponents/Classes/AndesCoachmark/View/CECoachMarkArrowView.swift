//
//  AndesCoachMarkArrowView.swift
//  CardsComponents
//
//  Created by JONATHAN DANIEL BANDONI on 17/07/2020.
//

class AndesCoachMarkArrowView: UIView {

    private lazy var arrowHeight: CGFloat = 2 * AndesCoachMarkConstants.Arrow.radius + 1
    private let arrowWidth: CGFloat
    private let direction: Direction

    private(set) var shapeLayer = CAShapeLayer()
    private(set) var headLayer = CAShapeLayer()

    // MARK: - Initialization
    required init(width: CGFloat, direction: Direction) {
        self.arrowWidth = width
        self.direction = direction
        super.init(frame: .zero)

        shapeLayer.frame = CGRect(x: 0, y: 0, width: arrowWidth, height: arrowHeight)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        headLayer.frame = CGRect(x: 0, y: 0, width: AndesCoachMarkConstants.Arrow.headWidth, height: AndesCoachMarkConstants.Arrow.headHeight)
        headLayer.fillColor = UIColor.clear.cgColor
        headLayer.strokeColor = UIColor.white.cgColor
        headLayer.lineWidth = 1
        layer.insertSublayer(shapeLayer, at: 0)
        layer.insertSublayer(headLayer, above: shapeLayer)
        setupViews()
    }

    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false

        setNeedsDisplay()
    }

    private func setupHead() -> CGPath {
        let path = UIBezierPath()
        let reference = CGPoint(x: AndesCoachMarkConstants.Arrow.headWidth, y: 0)
        path.move(to: reference)
        path.addLine(to: CGPoint(x: reference.x - AndesCoachMarkConstants.Arrow.headWidth, y: AndesCoachMarkConstants.Arrow.headHeight))
        path.move(to: reference)
        path.addLine(to: CGPoint(x: reference.x + AndesCoachMarkConstants.Arrow.headWidth, y: AndesCoachMarkConstants.Arrow.headHeight))
        return path.cgPath
    }

    private func toUpLeftArrow() -> CGPath {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: arrowWidth - AndesCoachMarkConstants.Arrow.radius, y: arrowHeight), radius: AndesCoachMarkConstants.Arrow.radius, startAngle: 0, endAngle: -.pi/2, clockwise: false)
        path.addArc(withCenter: CGPoint(x: AndesCoachMarkConstants.Arrow.radius + AndesCoachMarkConstants.Arrow.headWidth - AndesCoachMarkConstants.Arrow.correction, y: 1), radius: AndesCoachMarkConstants.Arrow.radius, startAngle: .pi/2, endAngle: .pi, clockwise: true)
        let translate = CATransform3DMakeTranslation(0, 1, 0)
        let rotate = CATransform3DMakeRotation(-AndesCoachMarkConstants.Arrow.upRotation, 0, 0, 1)
        headLayer.transform = CATransform3DConcat(rotate, translate)
        return path.cgPath
    }

    private func toUpRightArrow() -> CGPath {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: AndesCoachMarkConstants.Arrow.radius, y: arrowHeight), radius: AndesCoachMarkConstants.Arrow.radius, startAngle: .pi, endAngle: -.pi/2, clockwise: true)
        path.addArc(withCenter: CGPoint(x: arrowWidth - AndesCoachMarkConstants.Arrow.radius, y: 1), radius: AndesCoachMarkConstants.Arrow.radius, startAngle: .pi/2, endAngle: 0, clockwise: false)
        let translate = CATransform3DMakeTranslation(arrowWidth - AndesCoachMarkConstants.Arrow.headWidth - AndesCoachMarkConstants.Arrow.correction, 0, 0)
        let rotate = CATransform3DMakeRotation(AndesCoachMarkConstants.Arrow.upRotation, 0, 0, 1)
        headLayer.transform = CATransform3DConcat(rotate, translate)
        return path.cgPath
    }

    private func toDownLeftArrow() -> CGPath {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: arrowWidth - AndesCoachMarkConstants.Arrow.radius, y: 0), radius: AndesCoachMarkConstants.Arrow.radius, startAngle: 0, endAngle: .pi/2, clockwise: true)
        path.addArc(withCenter: CGPoint(x: AndesCoachMarkConstants.Arrow.radius + AndesCoachMarkConstants.Arrow.headWidth - AndesCoachMarkConstants.Arrow.correction, y: arrowHeight - 1), radius: AndesCoachMarkConstants.Arrow.radius, startAngle: -.pi/2, endAngle: .pi, clockwise: false)
        let translate = CATransform3DMakeTranslation(5, arrowHeight - AndesCoachMarkConstants.Arrow.headHeight, 0)
        let rotate = CATransform3DMakeRotation(-AndesCoachMarkConstants.Arrow.downRotation, 0, 0, 1)
        headLayer.transform = CATransform3DConcat(rotate, translate)
        return path.cgPath
    }

    private func toDownRightArrow() -> CGPath {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: AndesCoachMarkConstants.Arrow.radius, y: 0), radius: AndesCoachMarkConstants.Arrow.radius, startAngle: .pi, endAngle: .pi/2, clockwise: false)
        path.addArc(withCenter: CGPoint(x: arrowWidth - AndesCoachMarkConstants.Arrow.radius, y: arrowHeight - 1), radius: AndesCoachMarkConstants.Arrow.radius, startAngle: -.pi/2, endAngle: 0, clockwise: true)
        let translate = CATransform3DMakeTranslation(arrowWidth - AndesCoachMarkConstants.Arrow.correction, arrowHeight - AndesCoachMarkConstants.Arrow.headHeight, 0)
        let rotate = CATransform3DMakeRotation(AndesCoachMarkConstants.Arrow.downRotation, 0, 0, 1)
        headLayer.transform = CATransform3DConcat(rotate, translate)
        return path.cgPath
    }

    override func draw(_ rect: CGRect) {
        headLayer.path = setupHead()

        switch direction {
        case .toDownLeft:
            shapeLayer.path = toDownLeftArrow()
        case .toDownRight:
            shapeLayer.path = toDownRightArrow()
        case .toUpLeft:
            shapeLayer.path = toUpLeftArrow()
        case .toUpRight:
            shapeLayer.path = toUpRightArrow()
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: arrowWidth, height: arrowHeight)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

}

extension AndesCoachMarkArrowView {
    enum Direction {
        case toUpLeft
        case toUpRight
        case toDownLeft
        case toDownRight
    }

    static func getMinWidth() -> CGFloat {
        return AndesCoachMarkConstants.Arrow.radius * 2 + AndesCoachMarkConstants.Arrow.headWidth
    }
}
