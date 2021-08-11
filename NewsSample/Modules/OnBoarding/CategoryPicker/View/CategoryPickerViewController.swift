//
//  CategoryPickerViewController.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class CategoryPickerViewController: UIViewController, CategoryPickerViewProtocol {
    var presenter: CategoryPickerPresenterProtocol!
    lazy var containerView: CategoryPickerContainerView = {
        var view = CategoryPickerContainerView(presenter: self.presenter)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        self.view = containerView
    }
}
