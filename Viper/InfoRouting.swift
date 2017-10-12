//
//  InfoRouting.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/26/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol InfoRoutingInput: class {
    func goBack()
    func goHome()
}

class InfoRouting: InfoRoutingInput {
    
    weak var viewController: InfoViewController!
    
    // MARK: Initialization
    
    init(viewController: InfoViewController) {
        self.viewController = viewController
    }
    
    // MARK: InfoRoutingInput
    
    func goBack() {
        _ = viewController.navigationController?.popViewController(animated: true)
    }
    
    func goHome() {
        _ = viewController.navigationController?.popToRootViewController(animated: true)
    }
    
}
