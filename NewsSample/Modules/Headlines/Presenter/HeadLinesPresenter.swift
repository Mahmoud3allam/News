//
//  HeadLinesPresenter.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^

import Foundation
class HeadLinesPresenter: HeadLinesPresenterProtocol, HeadLinesInteractorOutPutProtocol {
    weak var view: HeadLinesViewProtocol?
    private let interactor: HeadLinesInteractorInPutProtocol
    private let router: HeadLinesRouterProtocol

    var newsPage: Int = 0
    var totalArticlesCount: Int = 0
    var isLoadedArticlesFirstTime: Bool = false
    var articles = [Article]()

    init(view: HeadLinesViewProtocol, interactor: HeadLinesInteractorInPutProtocol, router: HeadLinesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }

    func searchHeadLines(with keyWord: String) {
        let keyWorkWithOutSpaces = keyWord.replacingOccurrences(of: " ", with: "")
        self.newsPage = 1
        self.view?.showActivityIndicator()
        self.interactor.searchHeadLines(with: keyWorkWithOutSpaces, page: self.newsPage, isPaginating: false)
    }

    func numberOfHeadLines() -> Int {
        self.articles.count == 0 ?
            self.view?.showTableViewPlaceHolder(with: "Please search to refresh content.") :
            self.view?.hideTableViewPlaceHolder()
        return self.articles.count
    }

    func configureTableView(with cell: HeadLinesCellView, indexPath: IndexPath) {
        guard self.articles.count - 1 >= indexPath.item else {
            return
        }
        cell.setData(article: self.articles[indexPath.item])
    }

    func didSelectTableView(at _: IndexPath) {}

    func willDisplayCell(with Index: IndexPath, keyWord: String) {
        if Index.item == self.articles.count - 1 {
            if self.isLoadedArticlesFirstTime, canLoadMore() {
                self.newsPage += 1
                // Add Pagination Indicator
                self.view?.addPaginationIndicator()
                let keyWorkWithOutSpaces = keyWord.replacingOccurrences(of: " ", with: "")
                self.interactor.searchHeadLines(with: keyWorkWithOutSpaces, page: self.newsPage, isPaginating: true)
            }
        }
    }

    private func canLoadMore() -> Bool {
        if self.totalArticlesCount > self.articles.count {
            return true
        }
        self.view?.removePaginationIndicator()
        return false
    }

    func sucsessfullyFetchedHeadLines(headLine: HeadLinesEntity) {
        if let unwrappedArticles = headLine.articles, let totalItemsCount = headLine.totalResults {
            self.isLoadedArticlesFirstTime = true
            self.articles = unwrappedArticles
            self.totalArticlesCount = totalItemsCount
        }
        self.view?.dismissSearchController()
        self.view?.reloadTableView()
        if articles.count > 0 {
            view?.scrollToFirstIndex()
        }
        view?.hideActivityIndicator()
    }

    func sucsessfullyFetchedMoreHeadLines(headLine: HeadLinesEntity) {
        if let unwrappedArticles = headLine.articles, let totalItemsCount = headLine.totalResults {
            unwrappedArticles.forEach { self.articles.append($0) }
            self.totalArticlesCount = totalItemsCount
        }
        self.view?.removePaginationIndicator()
        self.view?.reloadTableView()
    }

    func failedToFetchHeadLines(with message: String) {
        self.view?.dismissSearchController()
        self.view?.hideActivityIndicator()
        self.view?.removePaginationIndicator()
        self.view?.showError(with: message)
    }
}
