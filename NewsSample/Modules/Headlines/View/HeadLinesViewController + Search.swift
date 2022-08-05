//
//  HeadLinesViewController + Search.swift
//  NewsSample
//
//  Created by Alchemist on 13/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit

extension HeadLinesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let unwrappedKeyword = searchBar.text, !unwrappedKeyword.isEmpty else {
            return
        }
        self.presenter.searchHeadLines(with: unwrappedKeyword)
    }
}
