//
//  Results.swift
//  CoreApp
//
//  Created by Tunc on 14.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import Foundation

struct Results<T:Codable> {
    let data: T?
}

extension Results: Decodable {
    
    private enum ResultsCodingKeys: String, CodingKey {
        case results = ""
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultsCodingKeys.self)
        
        data = try container.decode(T.self, forKey: .results)
    }
}
