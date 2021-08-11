//
//  CountryPickerRouter.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class CountryPickerRouter: CountryPickerRouterProtocol {
    weak var viewController: UIViewController?

    static func createAnModule() -> UIViewController {
        let interactor = CountryPickerInteractor()
        let router = CountryPickerRouter()
        let view = CountryPickerViewController()
        let presenter = CountryPickerPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
