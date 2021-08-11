//
//  FavourtiesProtocols.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
protocol FavourtiesViewProtocol: AnyObject {
    var presenter: FavourtiesPresenterProtocol! { get set }
}

protocol FavourtiesPresenterProtocol {
    var view: FavourtiesViewProtocol? { get set }

    func viewDidLoad()
}

protocol FavourtiesRouterProtocol {}

protocol FavourtiesInteractorInPutProtocol {
    var presenter: FavourtiesInteractorOutPutProtocol? { get set }
}

protocol FavourtiesInteractorOutPutProtocol: AnyObject {}
