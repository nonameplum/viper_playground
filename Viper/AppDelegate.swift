//
//  AppDelegate.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var mainRouting: MainRouting!
    let appDependecies = AppDependencies()
    lazy var moduleBuilder = AppModuleBuilder(appDependencies: self.appDependecies)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let deeplinkURL = URL(string: "app://users/details/lukas")
        
        mainRouting = MainRouting(window: window, loginService: appDependecies.loginService, moduleBuilder: moduleBuilder)
        mainRouting.openMainView()
        
        return true
    }

}
