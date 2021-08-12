//
//  CountryPickerContainerView + UITableView.swift
//  NewsSample
//
//  Created by Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit

extension CountryPickerContainerView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        self.presenter.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CountryCell.self), for: indexPath) as? CountryCell else {
            return UITableViewCell()
        }
        self.presenter.configure(countryCell: cell, for: indexPath)
        return cell
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didSelectItem(at: indexPath)
    }
}
