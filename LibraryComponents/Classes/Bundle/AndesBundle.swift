//
//  AndesBundle.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 05/12/2019.
//

import Foundation

public class AndesBundle {
    public static func bundle() -> Bundle {
        if let path = Bundle(for: self).path(forResource: "AndesUIResources", ofType: "bundle"),
            let bundle = Bundle(path: path) {
            return bundle
        }
        return Bundle.main
    }

    internal static func imageNamed(_ name: String) -> UIImage? {
        return UIImage.init(named: name, in: bundle(), compatibleWith: nil)
    }
}
