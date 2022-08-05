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
    private var maxSlectionCount: Int = 3
    private var selectedCategories = [String]()
    private var userDefaultsManager: UserDefaultsProtocol = UserDefaultsManager()

    init(view: CategoryPickerViewProtocol, interactor: CategoryPickerInteractorInPutProtocol, router: CategoryPickerRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }

    func numberOfItems() -> Int {
        HeadLinesCategories.allCases.count
    }

    func configure(categoryCell: CategoriesCellView, for indexPath: IndexPath) {
        categoryCell.setData(category: HeadLinesCategories.allCases[indexPath.item].rawValue)
    }

    func didSelectRow(at indexPath: IndexPath) {
        self.selectedCategories.append(HeadLinesCategories.allCases[indexPath.item].rawValue)
        self.selectedCategories.count == 3 ? self.view?.enableDoneButton() : self.view?.disableDoneButton()
    }

    func didDeSelectRow(at indexPath: IndexPath) {
        self.selectedCategories = self.selectedCategories.filter { $0 != HeadLinesCategories.allCases[indexPath.item].rawValue }
        self.view?.disableDoneButton()
    }

    func willSelectRow(currentIndexPath: IndexPath) -> IndexPath? {
        if !(self.selectedCategories.count < self.maxSlectionCount) {
            return nil
        }
        return currentIndexPath
    }

    func doneButtonTapped() {
        guard self.validateCategories() else {
            return
        }
        userDefaultsManager.write(key: UserDefaultsKeys.favouriteCategories, value: self.selectedCategories)
        self.router.setRoot()
    }

    private func validateCategories() -> Bool {
        self.selectedCategories.count == self.maxSlectionCount ? true : false
    }
}
