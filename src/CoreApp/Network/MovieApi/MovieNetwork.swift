//
//  MovieService.swift
//  CoreApp
//
//  Created by Tunc on 15.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import Foundation
import Moya
import Swinject

typealias MoviePagingCompletion = (_ data: PagingResults<[Movie]>?, _ error: String?)->()
typealias MovieDetailCompletion = (_ data: MovieDetail?, _ error: String?)->()

protocol MovieNetworking {
    func fetchMovies(page: Int, completion: @escaping MoviePagingCompletion)
    func findMovie(id: Int, completion: @escaping MovieDetailCompletion)
}

extension MovieNetworking {
    
    public var manager:NetworkManager<MovieApi> {
        get {
            return (UIApplication.shared.delegate as! AppDelegate).getContainer().resolve(NetworkManager<MovieApi>.self)!
        }
    }
}

class MovieNetwork: MovieNetworking {
    
    func fetchMovies(page: Int, completion: @escaping MoviePagingCompletion) {

        self.manager.provider.request(MovieApi.fetchMovies(page: page)) { result in
            switch result {
            case let .success(response):
                self.manager.parse(response){ res, mes in completion(res, mes) }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func findMovie(id: Int, completion: @escaping MovieDetailCompletion) {
        
        self.manager.provider.request(MovieApi.find(id: id)) { result in
            switch result {
            case let .success(response):
                self.manager.parse(response){ res, mes in completion(res, mes) }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
}
