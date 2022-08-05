//
//  HeadLinesViewController.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class HeadLinesViewController: UITableViewController, HeadLinesViewProtocol {
    var presenter: HeadLinesPresenterProtocol!
    lazy var searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = ColorTypes.background.value
        presenter.viewDidLoad()
        self.setupSearchController()
        self.setupTableViewBehaviors()
    }

    override func viewWillAppear(_: Bool) {
        self.setupNavigationBarBehaviors()
    }

    override func viewWillDisappear(_: Bool) {
        self.title = " "
    }

    private func setupNavigationBarBehaviors() {
        self.title = "Search"
    }

    private func setupSearchController() {
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        searchController.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.searchTextField.textColor = ColorTypes.mainTextColor.value
    }

    func showActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.view.showActivityIndicator(with: ._default, color: ColorTypes.mainTextColor.value)
        }
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.view.removeActivityIndicator()
        }
    }

    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.tableView.reloadData()
        }
    }

    func scrollToFirstIndex() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(item: 0, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }

    func dismissSearchController() {
        self.searchController.dismiss(animated: true, completion: nil)
    }

    func addPaginationIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let paginationSpinner = NormalIndicator()
            paginationSpinner.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 40)
            self.tableView.tableFooterView = paginationSpinner
        }
    }

    func removePaginationIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.tableView.tableFooterView = nil
        }
    }

    func showError(with message: String) {
        self.showDefaultAlert(title: "Error", message: message, actionTitle: "Ok!")
    }

    func showTableViewPlaceHolder(with title: String) {
        print("Show Place Holder with Title =  \(title)")
    }

    func hideTableViewPlaceHolder() {
        self.tableView.backgroundView = nil
    }
}
