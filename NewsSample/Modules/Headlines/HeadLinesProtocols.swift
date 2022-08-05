//
//  HeadLinesProtocols.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
protocol HeadLinesViewProtocol: AnyObject {
    var presenter: HeadLinesPresenterProtocol! { get set }

    func showActivityIndicator()
    func hideActivityIndicator()
    func reloadTableView()
    func scrollToFirstIndex()
    func dismissSearchController()
    func showTableViewPlaceHolder(with title: String)
    func hideTableViewPlaceHolder()
    func addPaginationIndicator()
    func removePaginationIndicator()
    func showError(with message: String)
}

protocol HeadLinesPresenterProtocol {
    var view: HeadLinesViewProtocol? { get set }

    func viewDidLoad()
    func searchHeadLines(with keyWord: String)
    func numberOfHeadLines() -> Int
    func configureTableView(with cell: HeadLinesCellView, indexPath: IndexPath)
    func didSelectTableView(at IndexPath: IndexPath)
    func willDisplayCell(with Index: IndexPath, keyWord: String)
}

protocol HeadLinesRouterProtocol {}

protocol HeadLinesInteractorInPutProtocol {
    var presenter: HeadLinesInteractorOutPutProtocol? { get set }

    func searchHeadLines(with keyWord: String, page: Int, isPaginating: Bool)
}

protocol HeadLinesInteractorOutPutProtocol: AnyObject {
    func sucsessfullyFetchedHeadLines(headLine: HeadLinesEntity)
    func sucsessfullyFetchedMoreHeadLines(headLine: HeadLinesEntity)
    func failedToFetchHeadLines(with message: String)
}

protocol HeadLinesCellView {
    func setData(article: Article)
}
