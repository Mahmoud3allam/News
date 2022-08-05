//
//  HeadLinesViewController + UITableView.swift
//  NewsSample
//
//  Created by Alchemist on 13/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit
extension HeadLinesViewController {
    func setupTableViewBehaviors() {
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(HeadLinesCell.self, forCellReuseIdentifier: NSStringFromClass(HeadLinesCell.self))
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        self.presenter.numberOfHeadLines()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HeadLinesCell.self), for: indexPath) as? HeadLinesCell else {
            return UITableViewCell()
        }
        self.presenter.configureTableView(with: cell, indexPath: indexPath)
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt _: IndexPath) {}

    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.presenter.willDisplayCell(with: indexPath, keyWord: self.searchController.searchBar.text ?? "")
        cell.alpha = 0
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            cell.alpha = 1
        }, completion: nil)
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
