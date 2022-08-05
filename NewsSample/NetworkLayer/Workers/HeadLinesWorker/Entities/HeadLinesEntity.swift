//
//  HeadLinesEntity.swift
//  NewsSample
//
//  Created by Alchemist on 13/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
struct HeadLinesEntity: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}
