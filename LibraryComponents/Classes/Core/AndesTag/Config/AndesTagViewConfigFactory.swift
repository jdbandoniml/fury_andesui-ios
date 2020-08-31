//
//  AndesTagViewConfigFactory.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/28/20.
//

import Foundation

internal class AndesTagViewConfigFactory {

    static func provideInternalConfig(fromSimpleTag tag: AndesTagSimple) -> AndesTagViewConfig {

        let type = AndesTagTypeFactory.provide(tag.type)
        let size = AndesTagSizeFactory.provide(tag.size)

        let backgroundColor = type.backgroundColor
        let borderColor = type.borderColor
        let buttonColor = type.buttonColor

        let height = size.height
        let horizontalPadding = size.horizontalPadding
        let cornerRadius = size.cornerRadius

        let text = tag.text
        let textFont = size.font
        let textColor = type.textColor

        let leftContent = size.shouldShowLeftContent ? tag.leftContent : nil
        let isDismissible = tag.isDismissible
        let rightButtonWidth = tag.isDismissible ? size.rightButtonWidth : 0

        return AndesTagViewConfig(backgroundColor: backgroundColor, borderColor: borderColor, buttonColor: buttonColor, height: height, horizontalPadding: horizontalPadding, cornerRadius: cornerRadius, text: text, textFont: textFont, textColor: textColor, leftContent: leftContent, isDismissible: isDismissible, rightButtonWidth: rightButtonWidth)
    }
}
