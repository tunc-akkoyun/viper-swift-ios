//
//  Loader.swift
//  CoreApp
//
//  Created by Tunc on 16.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import Foundation
import SVProgressHUD

struct Loader {
    
    static func show() {
        SVProgressHUD.show()
    }
    
    static func dismiss() {
        SVProgressHUD.dismiss()
    }
    
    static func error(_ text: String) {
        SVProgressHUD.showError(withStatus: text)
    }
    
    static func info(_ text: String) {
        SVProgressHUD.showInfo(withStatus: text)
    }
    
    static func success(_ text: String) {
        SVProgressHUD.showSuccess(withStatus: text)
    }
}
