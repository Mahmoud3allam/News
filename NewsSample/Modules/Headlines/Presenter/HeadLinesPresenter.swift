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

    init(view: HeadLinesViewProtocol, interactor: HeadLinesInteractorInPutProtocol, router: HeadLinesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }
}
