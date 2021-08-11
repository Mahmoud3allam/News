//
//  FavourtiesViewController.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class FavourtiesViewController: UIViewController, FavourtiesViewProtocol {
    var presenter: FavourtiesPresenterProtocol!
    lazy var containerView: FavourtiesContainerView = {
        var view = FavourtiesContainerView(presenter: self.presenter)
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
