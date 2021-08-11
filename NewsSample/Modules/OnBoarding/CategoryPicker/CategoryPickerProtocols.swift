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
}

protocol CategoryPickerPresenterProtocol {
    var view: CategoryPickerViewProtocol? { get set }

    func viewDidLoad()
}

protocol CategoryPickerRouterProtocol {}

protocol CategoryPickerInteractorInPutProtocol {
    var presenter: CategoryPickerInteractorOutPutProtocol? { get set }
}

protocol CategoryPickerInteractorOutPutProtocol: AnyObject {}
