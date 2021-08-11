//
//  CategoryPickerRouter.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class CategoryPickerRouter: CategoryPickerRouterProtocol {
    weak var viewController: UIViewController?

    static func createAnModule() -> UIViewController {
        let interactor = CategoryPickerInteractor()
        let router = CategoryPickerRouter()
        let view = CategoryPickerViewController()
        let presenter = CategoryPickerPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
