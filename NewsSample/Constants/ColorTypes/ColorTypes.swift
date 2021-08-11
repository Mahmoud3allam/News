//
//  ColorTypes.swift
//  NewsSample
//
//  Created by Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit

enum ColorTypes {
    case background
    case mainTextColor

    // Here we can provide a color in a light mode and other one for the dark mode system based.
    var value: UIColor {
        switch self {
        case .background:
            return UIColor.dynamicColor(light: .white, dark: #colorLiteral(red: 0.07057783753, green: 0.07059488446, blue: 0.07057412714, alpha: 1))
        case .mainTextColor:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.07057783753, green: 0.07059488446, blue: 0.07057412714, alpha: 1), dark: .white)
        }
    }
}
