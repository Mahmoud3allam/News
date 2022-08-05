//
//  HeadLinesWorker.swift
//  NewsSample
//
//  Created by Alchemist on 13/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
protocol HeadLinesWorkerProtocol {
    func search(keyWord: String, page: Int, country: String, category: String, completion: @escaping (Swift.Result<HeadLinesEntity?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class HeadLinesWorker: APIRequestExecuter<HeadLinesNetworking>, HeadLinesWorkerProtocol {
    func search(keyWord: String, page: Int, country: String, category: String, completion: @escaping (Result<HeadLinesEntity?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .search(keyWord: keyWord, page: page, country: country, category: category), responseClass: HeadLinesEntity.self) { results in
            completion(results)
        }
    }
}
