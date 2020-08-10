//
//  UILabel+LineHeight.swift
//  CardsEngagement
//
//  Created by JONATHAN DANIEL BANDONI on 03/08/2020.
//

extension UILabel {
    public func addLineHeight(_ lineHeight: CGFloat = 25.0) {

        let attributedString = NSMutableAttributedString()
        if let attrText = self.attributedText {
            attributedString.append(attrText)
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = CGFloat(lineHeight)
        paragraphStyle.alignment = self.textAlignment

        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString

    }
}
