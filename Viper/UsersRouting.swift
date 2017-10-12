//
//  UsersRouting.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol UsersRoutingInput: class {
    func navigateToUserDetails()
}

class UsersRouting: UsersRoutingInput {
    
    weak var viewController: UsersViewController!
    let moduleBuilder: ModuleBuilder
    
    // MARK: Initialization
    
    init(viewController: UsersViewController, moduleBuilder: ModuleBuilder) {
        self.viewController = viewController
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: UsersRoutingInput
    
    func navigateToUserDetails() {
        let userDetailsVC = moduleBuilder.buildUserDetailsModuleFactory(delegate: viewController.presenter).instantiateViewController()
        viewController.navigationController?.pushViewController(userDetailsVC, animated: true)
    }
    
}
