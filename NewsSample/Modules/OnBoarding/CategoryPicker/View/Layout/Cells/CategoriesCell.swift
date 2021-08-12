//
//  CategoriesCell.swift
//  NewsSample
//
//  Created by Alchemist on 12/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit
class CategoriesCell: UITableViewCell, CategoriesCellView {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .random
        self.textLabel?.font = UIFont(name: FontTypes.boldFont.name, size: 25)
        self.textLabel?.textAlignment = .center
        self.selectionStyle = .blue
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(category: String) {
        self.textLabel?.text = category.capitalized
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            contentView.layer.borderColor = UIColor.systemBlue.cgColor
            contentView.layer.borderWidth = 6
        } else {
            contentView.layer.borderColor = UIColor.clear.cgColor
            contentView.layer.borderWidth = 0
        }
    }
}
