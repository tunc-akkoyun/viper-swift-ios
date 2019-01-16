//
//  NetworkManager.swift
//  CoreApp
//
//  Created by Tunc on 14.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import Foundation
import Moya

public struct NetworkManager<T:TargetType> {
    
    internal let provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin(verbose: true), NetworkActivityPlugin(networkActivityClosure: { (activity, target) in
        switch activity {
            case .began: Loader.show()
            case .ended: Loader.dismiss()
        }
    })])
    
    
    func parse<T: Decodable>(_ response: (Response), completion: @escaping (T?, _ message: String)->()) {
        do {
            let results = try JSONDecoder().decode(T?.self, from: response.data)
            completion(results, "")
        }catch let err {
            completion(nil, err.localizedDescription)
        }
    }
}
