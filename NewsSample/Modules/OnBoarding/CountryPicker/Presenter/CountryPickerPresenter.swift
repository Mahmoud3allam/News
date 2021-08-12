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
    private var selectedCountryIndex: IndexPath?
    private var userDefaultsManager: UserDefaultsProtocol = UserDefaultsManager()

    init(view: CountryPickerViewProtocol, interactor: CountryPickerInteractorInPutProtocol, router: CountryPickerRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }

    func numberOfItems() -> Int {
        CountriesISO3166.allCases.count
    }

    func configure(countryCell: CountryCellView, for indexPath: IndexPath) {
        let textToDisplay = CountriesISO3166.allCases[indexPath.item].flag + "   " + CountriesISO3166.allCases[indexPath.item].country
        countryCell.setData(countryData: textToDisplay)
    }

    func didSelectItem(at indexPath: IndexPath) {
        guard CountriesISO3166.allCases.count - 1 >= indexPath.item else {
            return
        }
        self.selectedCountryIndex = indexPath
        print("iSO = \(CountriesISO3166.allCases[indexPath.item].isoCode)")
        self.view?.enableDoneButton()
    }

    func didTappedDoneButton() {
        if let selectedIndex = self.selectedCountryIndex {
            guard CountriesISO3166.allCases.count - 1 >= selectedIndex.item else {
                return
            }
            let selectedCountry = CountriesISO3166.allCases[selectedIndex.item]
            userDefaultsManager.write(key: UserDefaultsKeys.favouriteCountry, value: selectedCountry.country)

            self.router.navigateToCategoryPickerScene(selectedCountry: selectedCountry)
        }
    }
}
