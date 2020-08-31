//
//  AndesTagViewConfig.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/28/20.
//

import Foundation

internal struct AndesTagViewConfig {

    var backgroundColor: UIColor = UIColor.clear
    var borderColor: UIColor = UIColor.Andes.gray250
    var buttonColor: UIColor = UIColor.Andes.gray450

    var height: CGFloat?
    var horizontalPadding: CGFloat?
    var cornerRadius: CGFloat?

    var text: String? = "Label"
    var textFont: UIFont?
    var textColor: UIColor = UIColor.Andes.gray800

    var leftContent: AndesTagLeftContent?

    var isDismissable: Bool = false
    var rightButtonWidth: CGFloat = 0

    init() {}

    init(backgroundColor: UIColor, borderColor: UIColor, buttonColor: UIColor, height: CGFloat, horizontalPadding: CGFloat, cornerRadius: CGFloat, text: String?, textFont: UIFont, textColor: UIColor, leftContent: AndesTagLeftContent? = nil, isDismissible: Bool = false, rightButtonWidth: CGFloat) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.buttonColor = buttonColor

        self.height = height
        self.horizontalPadding = horizontalPadding
        self.cornerRadius = cornerRadius

        self.text = text
        self.textFont = textFont
        self.textColor = textColor

        self.leftContent = leftContent
        self.isDismissable = isDismissible
        self.rightButtonWidth = rightButtonWidth
    }
}
