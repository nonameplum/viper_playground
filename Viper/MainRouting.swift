//
//  MainRouting.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/30/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import UIKit

protocol DeeplinkRouteable {
    func open(url: URL, completion: () -> Void) -> Bool
}

protocol MainRoutingInput: class {
    func openMainView(url: URL?)
}

class MainRouting: MainRoutingInput, DeeplinkRouteable {
    
    let window: UIWindow
    let moduleBuilder: ModuleBuilder
    let loginService: LoginServiceProtocol
    
    init(window: UIWindow, loginService: LoginServiceProtocol, moduleBuilder: ModuleBuilder) {
        self.window = window
        self.moduleBuilder = moduleBuilder
        self.loginService = loginService
        self.loginService.logoutDelegate = self
    }
    
    // MARK: MainRoutingInput
    
    func openMainView(url: URL? = nil) {
        if loginService.isLoggedIn {
            openUsersModule()
        } else {
            openAuthenticationModule()
        }
        
        window.makeKeyAndVisible()
    }

    // MARK: Convenience

    func openUsersModule() {
        window.rootViewController = UINavigationController(rootViewController: moduleBuilder.usersModuleFactory().instantiateViewController())
    }

    func openAuthenticationModule() {
        window.rootViewController = moduleBuilder.buildAuthenticationModuleFactory().instantiateViewController()
    }

    // MARK: DeeplinkRouteable

    func open(url: URL, completion: () -> Void) -> Bool {
        guard url.pathComponents.first?.contains("users") ?? false else { return false }
        openMainView(url: url)
        completion()
        return true
    }
    
}

extension MainRouting: LoginServiceLogoutDelegateProtocol {

    func didLogout() {
        openAuthenticationModule()
    }

}
