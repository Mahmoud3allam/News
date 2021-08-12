//
//  CategoryPickerContainerView + UITableView.swift
//  NewsSample
//
//  Created by Alchemist on 12/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit
extension CategoryPickerContainerView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        self.presenter.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CategoriesCell.self), for: indexPath) as? CategoriesCell else {
            return UITableViewCell()
        }
        self.presenter.configure(categoryCell: cell, for: indexPath)
        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didSelectRow(at: indexPath)
    }

    func tableView(_: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.presenter.didDeSelectRow(at: indexPath)
    }

    func tableView(_: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.presenter.willSelectRow(currentIndexPath: indexPath)
    }
}
