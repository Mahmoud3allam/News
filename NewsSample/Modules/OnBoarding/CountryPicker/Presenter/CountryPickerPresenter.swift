//
//  CountryPickerPresenter.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^

import Foundation
class CountryPickerPresenter: CountryPickerPresenterProtocol, CountryPickerInteractorOutPutProtocol {
    weak var view: CountryPickerViewProtocol?
    private let interactor: CountryPickerInteractorInPutProtocol
    private let router: CountryPickerRouterProtocol

    init(view: CountryPickerViewProtocol, interactor: CountryPickerInteractorInPutProtocol, router: CountryPickerRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }
}
