//
//  Extensions.swift
//  CoreApp
//
//  Created by Tunc on 16.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import Foundation
import Swinject

extension UIViewController {
    
    func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var container : Container {
        return (UIApplication.shared.delegate as! AppDelegate).getContainer()
    }
}
