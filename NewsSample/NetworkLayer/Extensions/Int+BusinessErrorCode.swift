//
//  Int+BusinessErrorCode.swift
//  NewsSample
//
//  Created by Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation

extension Int {
    func getAPIRequestResponseBusinessError() -> BaseAPIRequestResponseBusinessErrorType {
        switch self {
        case 20017:
            return .providerError
        default:
            return .providerError
        }
    }
}
