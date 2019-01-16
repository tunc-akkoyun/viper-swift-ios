//
//  MovieApi.swift
//  CoreApp
//
//  Created by Tunc on 15.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import Foundation
import Moya

enum MovieApi {
    case fetchMovies(page:Int)
    case find(id: Int)
    case account()
}

extension MovieApi: TargetType {
    var baseURL: URL {
        return URL(string: Config.apiBaseUrl)!
    }
    
    var path: String {
        switch self {
        case .fetchMovies:
            return "movie/now_playing"
        case .find(let id):
            return "movie/\(id)"
        case .account:
            return "account"
//        case .fetchWatchers(let repo):
//            return "repos/\(repo)/watchers"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchMovies, .find, .account:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchMovies(let page):
            return .requestParameters(parameters: ["page":page, "api_key": Config.APIKey], encoding: URLEncoding.queryString)
        case .find(let id):
            return .requestParameters(parameters: ["id":id, "api_key": Config.APIKey], encoding: URLEncoding.queryString)
        case .account:
            return .requestParameters(parameters: ["api_key": Config.APIKey], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        return ["Content-Type":"Application/json"]
    }
}
