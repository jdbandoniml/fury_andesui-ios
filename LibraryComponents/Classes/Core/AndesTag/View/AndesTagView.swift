//
//  AndesTagSimpleView.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/27/20.
//

import Foundation

internal protocol AndesTagView: UIView {
    var delegate: AndesTagViewDelegate? { get set }
    func update(withConfig config: AndesTagViewConfig)
}
