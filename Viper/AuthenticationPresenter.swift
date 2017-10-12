//
//  AuthenticationPresenter.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol AuthenticationPresenterInput: AuthenticationViewControllerOutput, AuthenticationInteractorOutput {
    
}

class AuthenticationPresenter: AuthenticationPresenterInput {
    
    // MARK: Properties

    weak var view: AuthenticationViewControllerInput!
    var interactor: AuthenticationInteractorInput
    var router: AuthenticationRoutingInput
    
    // MARK: Initialization
    
    init(view: AuthenticationViewControllerInput, interactor: AuthenticationInteractorInput, router: AuthenticationRoutingInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: AuthenticationViewControllerOutput
    
    func login(username: String?, password: String?) {
        interactor.login(username: username, password: password)
    }
    
    func validate(username: String?, password: String?) {
        interactor.validate(username: username, password: password)
    }
    
}

extension AuthenticationPresenter: AuthenticationInteractorOutput {

    func successfulyLoggedIn() {
        router.navigateToUsers()
    }

    func loginFailed() {
        view.setInvalidCredentailsMessage(message: "Invalid username or password!")
    }

    func validated(valid: Bool) {
        view.setInvalidCredentailsMessage(message: "")
        view.setLoginEnabled(enabled: valid)
    }

}
