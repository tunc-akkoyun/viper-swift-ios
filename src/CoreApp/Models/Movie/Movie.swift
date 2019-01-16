//
//  Movie.swift
//  CoreApp
//
//  Created by Tunc on 14.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import Foundation

struct Movie: Encodable {
    let id: Int
    let title: String
}

extension Movie: Decodable {
    enum MovieCodingKeys: String, CodingKey {
        case id
        case title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
    }
}
