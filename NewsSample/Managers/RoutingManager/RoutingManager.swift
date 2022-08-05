//
//  RoutingManager.swift
//  NewsSample
//
//  Created by Alchemist on 12/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit
class RoutingManager {
    private let userDefaultsManager: UserDefaultsProtocol = UserDefaultsManager()
    static let shared = RoutingManager()

    init() {}

    func getRoot() -> UIViewController {
        if isFavouriteCountrySelected(), isFavouriteCategoriesSelected() {
            return NewsTabBar()
        } else if isFavouriteCountrySelected(), !isFavouriteCategoriesSelected() {
            if let _: String = self.userDefaultsManager.value(key: UserDefaultsKeys.favouriteCountry) {
                return BaseNavigationController(rootViewController: CategoryPickerRouter.createAnModule())
            } else {
                return BaseNavigationController(rootViewController: CountryPickerRouter.createAnModule())
            }
        } else if isFavouriteCategoriesSelected(), !isFavouriteCountrySelected() {
            return BaseNavigationController(rootViewController: CountryPickerRouter.createAnModule())
        }
        return BaseNavigationController(rootViewController: CountryPickerRouter.createAnModule())
    }

    private func isFavouriteCountrySelected() -> Bool {
        if let favouriteCountry: String = self.userDefaultsManager.value(key: UserDefaultsKeys.favouriteCountry) {
            guard !favouriteCountry.isEmpty else {
                return false
            }
            return true
        }
        return false
    }

    private func isFavouriteCategoriesSelected() -> Bool {
        if let favouriteCategories: [String] = self.userDefaultsManager.value(key: UserDefaultsKeys.favouriteCategories) {
            guard favouriteCategories.count == 3 else {
                return false
            }
            return true
        }
        return false
    }
}
