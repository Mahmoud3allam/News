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

    func enableDoneButton()
}

protocol CountryPickerPresenterProtocol {
    var view: CountryPickerViewProtocol? { get set }

    func viewDidLoad()
    func numberOfItems() -> Int
    func configure(countryCell: CountryCellView, for indexPath: IndexPath)
    func didSelectItem(at indexPath: IndexPath)
    func didTappedDoneButton()
}

protocol CountryPickerRouterProtocol {
    func navigateToCategoryPickerScene(selectedCountry: CountriesISO3166)
}

protocol CountryPickerInteractorInPutProtocol {
    var presenter: CountryPickerInteractorOutPutProtocol? { get set }
}

protocol CountryPickerInteractorOutPutProtocol: AnyObject {}

protocol CountryCellView {
    func setData(countryData: String)
}
