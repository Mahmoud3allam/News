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
        self.title = "Select 3 Categories"
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
        self.presenter.doneButtonTapped()
    }

    func enableDoneButton() {
        self.doneButton.isEnabled = true
    }

    func disableDoneButton() {
        self.doneButton.isEnabled = false
    }
}
