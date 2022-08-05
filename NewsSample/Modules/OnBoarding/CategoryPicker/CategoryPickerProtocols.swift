//
//  CategoryPickerProtocols.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
protocol CategoryPickerViewProtocol: AnyObject {
    var presenter: CategoryPickerPresenterProtocol! { get set }

    func enableDoneButton()
    func disableDoneButton()
}

protocol CategoryPickerPresenterProtocol {
    var view: CategoryPickerViewProtocol? { get set }

    func viewDidLoad()
    func numberOfItems() -> Int
    func configure(categoryCell: CategoriesCellView, for indexPath: IndexPath)
    func didSelectRow(at indexPath: IndexPath)
    func didDeSelectRow(at indexPath: IndexPath)
    func willSelectRow(currentIndexPath: IndexPath) -> IndexPath?
    func doneButtonTapped()
}

protocol CategoryPickerRouterProtocol {
    func setRoot()
}

protocol CategoryPickerInteractorInPutProtocol {
    var presenter: CategoryPickerInteractorOutPutProtocol? { get set }
}

protocol CategoryPickerInteractorOutPutProtocol: AnyObject {}

protocol CategoriesCellView {
    func setData(category: String)
}
