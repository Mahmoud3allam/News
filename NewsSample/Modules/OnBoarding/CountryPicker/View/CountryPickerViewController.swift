//
//  CountryPickerViewController.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class CountryPickerViewController: UIViewController, CountryPickerViewProtocol {
    var presenter: CountryPickerPresenterProtocol!
    lazy var containerView: CountryPickerContainerView = {
        var view = CountryPickerContainerView(presenter: self.presenter)
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
