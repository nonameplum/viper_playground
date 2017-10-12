//
//  InfoPresenter.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/26/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol InfoPresenterInput: InfoViewControllerOutput {
    
}

class InfoPresenter: InfoPresenterInput {
    
    // MARK: Properties
    
    var router: InfoRoutingInput
    
    // MARK: Initialization
    
    init(router: InfoRoutingInput) {
        self.router = router
    }
    
}

extension InfoPresenter: InfoViewControllerOutput {

    func goBack() {
        router.goBack()
    }

    func goHome() {
        router.goHome()
    }

}
