//
//  MovieDetail.swift
//  CoreApp
//
//  Created by Tunc on 16.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import Foundation

struct MovieDetail: Encodable {
    let id: Int
    let title: String
    let overview: String
}

extension MovieDetail: Decodable {
    enum MovieDetailCodingKeys: String, CodingKey {
        case id
        case title
        case overview
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieDetailCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        overview = try container.decode(String.self, forKey: .overview)
    }
}
