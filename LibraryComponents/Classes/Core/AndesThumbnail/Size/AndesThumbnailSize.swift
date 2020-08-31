//
//  AndesThumbnailSize.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

/**
The AndesThumbnailSize contains the differents sizes that a Thumbnail supports
*/
@objc public enum AndesThumbnailSize: Int, AndesEnumStringConvertible {

	case size24
	case size32
	case size40
	case size48
	case size56
	case size64
	case size72
	case size80

	public static func keyFor(_ value: AndesThumbnailSize) -> String {
		switch value {
		case .size24: return "24"
		case .size32: return "32"
		case .size40: return "40"
		case .size48: return "48"
		case .size56: return "56"
		case .size64: return "64"
		case .size72: return "72"
		case .size80: return "80"
		}
	}
}
