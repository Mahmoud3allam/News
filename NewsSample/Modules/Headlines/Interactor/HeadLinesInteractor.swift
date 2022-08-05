//
//  HeadLinesInteractor.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
class HeadLinesInteractor: HeadLinesInteractorInPutProtocol {
    weak var presenter: HeadLinesInteractorOutPutProtocol?
    private let headLinesWorker: HeadLinesWorkerProtocol = HeadLinesWorker()
    private let userDefaultsManager: UserDefaultsProtocol = UserDefaultsManager()

    func searchHeadLines(with keyWord: String, page: Int, isPaginating: Bool) {
        guard let favouriteCounty: String = self.userDefaultsManager.value(key: UserDefaultsKeys.favouriteCountry),
              let favouriteCategories: [String] = self.userDefaultsManager.value(key: UserDefaultsKeys.favouriteCategories)
        else {
            return
        }
        headLinesWorker.search(keyWord: keyWord, page: page, country: favouriteCounty, category: favouriteCategories[0]) { results in
            switch results {
            case let .success(headLines):
                if let unwrappedHeadLineEntity = headLines {
                    if isPaginating {
                        self.presenter?.sucsessfullyFetchedMoreHeadLines(headLine: unwrappedHeadLineEntity)
                    } else {
                        self.presenter?.sucsessfullyFetchedHeadLines(headLine: unwrappedHeadLineEntity)
                    }
                } else {
                    self.presenter?.failedToFetchHeadLines(with: BaseAPIRequestResponseFailureErrorType.parse.message)
                }
            case let .failure(error):
                self.presenter?.failedToFetchHeadLines(with: error.message)
            }
        }
    }
}
