//
//  BaseNavigationController.swift
//  NewsSample
//
//  Created by Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit
class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBarBehaviors()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }

    private func setupNavigationBarBehaviors() {
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.backgroundColor = ColorTypes.background.value
        self.navigationBar.barTintColor = ColorTypes.background.value
        self.navigationBar.tintColor = ColorTypes.mainTextColor.value
        self.navigationBar.isTranslucent = false
        let textAttributeWhenSmallTitle = [NSAttributedString.Key.foregroundColor: ColorTypes.mainTextColor.value, NSAttributedString.Key.font: UIFont(name: FontTypes.boldFont.name, size: 20)]
        self.navigationBar.titleTextAttributes = textAttributeWhenSmallTitle as [NSAttributedString.Key: Any]
        let textAttributeWhenLargeTitle = [NSAttributedString.Key.foregroundColor: ColorTypes.mainTextColor.value, NSAttributedString.Key.font: UIFont(name: FontTypes.boldFont.name, size: 30)]
        self.navigationBar.largeTitleTextAttributes = textAttributeWhenLargeTitle as [NSAttributedString.Key: Any]
        self.setStatusBarBackGroundColor(withColor: ColorTypes.background.value)
    }
}
