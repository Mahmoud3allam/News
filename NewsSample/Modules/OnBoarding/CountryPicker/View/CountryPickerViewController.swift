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

    private lazy var doneButton: UIBarButtonItem = {
        var button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTappedDoneButton))
        button.tintColor = .systemBlue
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
        self.title = "Choose Country"
        self.addDoneButton()
    }

    override func loadView() {
        super.loadView()
        self.view = containerView
    }

    private func addDoneButton() {
        self.navigationItem.rightBarButtonItems = [self.doneButton]
    }

    @objc func didTappedDoneButton() {
        print("Done Button")
        self.presenter.didTappedDoneButton()
    }

    func enableDoneButton() {
        self.doneButton.isEnabled = true
    }
}
