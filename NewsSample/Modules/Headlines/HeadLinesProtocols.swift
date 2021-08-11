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
}

protocol HeadLinesPresenterProtocol {
    var view: HeadLinesViewProtocol? { get set }

    func viewDidLoad()
}

protocol HeadLinesRouterProtocol {}

protocol HeadLinesInteractorInPutProtocol {
    var presenter: HeadLinesInteractorOutPutProtocol? { get set }
}

protocol HeadLinesInteractorOutPutProtocol: AnyObject {}
