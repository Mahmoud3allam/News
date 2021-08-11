//
//  UIColor + DarkMode.swift
//  NewsSample
//
//  Created by Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return light
        }
        return UIColor {
            switch $0.userInterfaceStyle {
            case .dark:
                return dark
            default:
                return light
            }
        }
    }

    static func `init`(color: ColorTypes) -> UIColor {
        color.value
    }
}
