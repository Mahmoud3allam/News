//
//  HeadLinesRouter.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class HeadLinesRouter: HeadLinesRouterProtocol {
    weak var viewController: UIViewController?

    static func createAnModule() -> UIViewController {
        let interactor = HeadLinesInteractor()
        let router = HeadLinesRouter()
        let view = HeadLinesViewController()
        let presenter = HeadLinesPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
