//
//  AuthenticationRouting.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import UIKit

protocol AuthenticationRoutingInput: class {
    func navigateToUsers()
}

class AuthenticationRouting: AuthenticationRoutingInput {
    
    weak var viewController: AuthenticationViewController!
    let moduleBuilder: ModuleBuilder
    
    // MARK: Initialization
    
    init(viewController: AuthenticationViewController, moduleBuilder: ModuleBuilder) {
        self.viewController = viewController
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: AuthenticationRoutingInput
    
    func navigateToUsers() {
        let usersVC = moduleBuilder.usersModuleFactory().instantiateViewController()
        let navigationController = UINavigationController(rootViewController: usersVC)
        viewController.view.window?.rootViewController = navigationController
    }
    
}
