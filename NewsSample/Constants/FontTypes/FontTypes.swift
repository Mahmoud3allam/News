//
//  FontTypes.swift
//  NewsSample
//
//  Created by Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit

enum FontTypes: String {
    case regularFont
    case boldFont
    case lightFont
    case semiBold

    // Here we can provide a font for AR and other font for different languages based on localization
    var name: String {
        switch self {
        case .regularFont:
            return "Cairo-Regular"
        case .boldFont:
            return "Cairo-Bold"
        case .lightFont:
            return "Cairo-Light"
        case .semiBold:
            return "Cairo-SemiBold"
        }
    }
}
