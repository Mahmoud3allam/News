//
//  UIViewController + Alert.swift
//  NewsSample
//
//  Created by Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func showDefaultAlert(title: String?, message: String?, actionTitle: String?, actionBlock: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

            let action = UIAlertAction(title: actionTitle, style: .default) { _ in
                alertController.dismiss(animated: true)
                actionBlock?()
            }

            alertController.addAction(action)
            self?.present(alertController, animated: true)
        }
    }
}
