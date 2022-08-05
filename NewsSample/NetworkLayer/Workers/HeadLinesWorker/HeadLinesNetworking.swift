//
//  HeadLinesNetworking.swift
//  NewsSample
//
//  Created by Alchemist on 13/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Alamofire
import Foundation
enum HeadLinesNetworking {
    case search(keyWord: String, page: Int, country: String, category: String)
}

extension HeadLinesNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .search:
            return "top-headlines"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .search(keyWord, page, country, category):
            var parameters = [String: Any]()
            parameters["q"] = keyWord
            parameters["page"] = page
            parameters["apiKey"] = NetworkConstant.apiKey.rawValue
            parameters["country"] = country
            parameters["category"] = category
            parameters["sortBy"] = "publishedAt"
            return .WithParametersRequest(parameters: parameters, encoding: URLEncoding.default)
        }
    }
}
