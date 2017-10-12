//
//  AppContext.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/30/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

class AppContext {
    
    private let userDefaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get { return  userDefaults.bool(forKey: "isLoggedIn") }
        set { userDefaults.set(newValue, forKey: "isLoggedIn") }
    }

}
