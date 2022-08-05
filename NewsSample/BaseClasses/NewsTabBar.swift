//
//  NewsTabBar.swift
//  NewsSample
//
//  Created by Alchemist on 12/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit
class NewsTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ColorTypes.mainTextColor.value
        self.tabBar.tintColor = ColorTypes.mainTextColor.value
        self.tabBar.isTranslucent = false
        self.viewControllers = [
            self.setNavigationController(rootViewController: HeadLinesRouter.createAnModule(), withTitle: "HeadLines", withImage: #imageLiteral(resourceName: "search_d")),
            self.setNavigationController(rootViewController: FavourtiesRouter.createAnModule(), withTitle: "Favourites", withImage: #imageLiteral(resourceName: "favorite_d"))
        ]
        self.setStatusBarBackGroundColor(withColor: ColorTypes.background.value)
    }

    fileprivate func setNavigationController(rootViewController: UIViewController, withTitle: String, withImage: UIImage?) -> UIViewController {
        let navController = BaseNavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = withTitle
        navController.tabBarItem.title = withTitle
        navController.tabBarItem.image = withImage

        return navController
    }
}
