//
//  Config.swift
//  CoreApp
//
//  Created by Tunc on 15.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import Foundation

enum Environment {
    case test
    case prod
}

struct Config {
    static let APIKey: String = "a79038a421e04bf527a89aace06217fd"

    static let environment: Environment = .prod
    
    static let apiBaseUrl: String = {
        switch environment {
        case .test:
            return "http://api.themoviedb.org/3/"
        case .prod:
            return "http://api.themoviedb.org/3/"
        }
    }()
}
