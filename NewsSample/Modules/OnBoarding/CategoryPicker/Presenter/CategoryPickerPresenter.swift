//
//  CategoryPickerPresenter.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^

import Foundation
class CategoryPickerPresenter: CategoryPickerPresenterProtocol, CategoryPickerInteractorOutPutProtocol {
    weak var view: CategoryPickerViewProtocol?
    private let interactor: CategoryPickerInteractorInPutProtocol
    private let router: CategoryPickerRouterProtocol

    init(view: CategoryPickerViewProtocol, interactor: CategoryPickerInteractorInPutProtocol, router: CategoryPickerRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }
}
