//
//  FavourtiesPresenter.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^

import Foundation
class FavourtiesPresenter: FavourtiesPresenterProtocol, FavourtiesInteractorOutPutProtocol {
    weak var view: FavourtiesViewProtocol?
    private let interactor: FavourtiesInteractorInPutProtocol
    private let router: FavourtiesRouterProtocol

    init(view: FavourtiesViewProtocol, interactor: FavourtiesInteractorInPutProtocol, router: FavourtiesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }
}
