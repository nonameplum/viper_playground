//
//  UserDetailsRouting.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/26/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol UserDetailsRoutingInput: class {
    func navigateToInfo()
    func navigateBackToUsers()
}

class UserDetailsRouting: UserDetailsRoutingInput {
    
    weak var viewController: UserDetailsViewController!
    let moduleBuilder: ModuleBuilder
    
    // MARK: Initialization
    
    init(viewController: UserDetailsViewController, moduleBuilder: ModuleBuilder) {
        self.viewController = viewController
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: UserDetailsRoutingInput
    
    func navigateToInfo() {
        let infoVC = moduleBuilder.buildInfoModuleFactory().instantiateViewController()
        
        _ = viewController.navigationController?.pushViewController(infoVC, animated: true)
    }
    
    func navigateBackToUsers() {
        _ = viewController.navigationController?.popViewController(animated: true)
    }
    
}
