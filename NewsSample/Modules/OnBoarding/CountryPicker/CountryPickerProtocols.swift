//
//  CountryPickerProtocols.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
protocol CountryPickerViewProtocol: AnyObject {
    var presenter: CountryPickerPresenterProtocol! { get set }
}

protocol CountryPickerPresenterProtocol {
    var view: CountryPickerViewProtocol? { get set }

    func viewDidLoad()
}

protocol CountryPickerRouterProtocol {}

protocol CountryPickerInteractorInPutProtocol {
    var presenter: CountryPickerInteractorOutPutProtocol? { get set }
}

protocol CountryPickerInteractorOutPutProtocol: AnyObject {}
