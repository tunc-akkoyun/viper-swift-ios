//
//  PagingResults.swift
//  CoreApp
//
//  Created by Tunc on 16.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import Foundation

struct PagingResults<T:Codable> {
    let page: Int
    let numberOfResults: Int
    let numberOfPages: Int
    let data: T?
}

extension PagingResults: Decodable {
    
    private enum PagingResultsCodingKeys: String, CodingKey {
        case page
        case numberOfResults = "total_results"
        case numberOfPages = "total_pages"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PagingResultsCodingKeys.self)
        
        page = try container.decode(Int.self, forKey: .page)
        numberOfResults = try container.decode(Int.self, forKey: .numberOfResults)
        numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)
        data = try container.decode(T.self, forKey: .results)
    }
}
