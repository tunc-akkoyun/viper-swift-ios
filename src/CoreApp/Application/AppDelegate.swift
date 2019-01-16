//
//  AppDelegate.swift
//  CoreApp
//
//  Created by Tunc on 14.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import UIKit
import Swinject
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var container = Container() { container in registerAPIs(containers: container) }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    static func registerAPIs(containers: Container){
        
        // Register each api manager and service
        
        // - MARK: Movie API
        containers.register(NetworkManager<MovieApi>.self, factory: { (container) in
            NetworkManager<MovieApi>()
        }).inObjectScope(ObjectScope.container)
        
        containers.register(MovieNetworking.self, factory: { (container) in
            MovieNetwork()
        }).inObjectScope(ObjectScope.container)
    }
}

extension AppDelegate {
    func getContainer() -> Container {
        return container
    }
}
