//
//  AuthenticationInteractor.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol AuthenticationInteractorInput: class {
    func login(username: String?, password: String?)
    func validate(username: String?, password: String?)
}

protocol AuthenticationInteractorOutput: class {
    func successfulyLoggedIn()
    func loginFailed()
    func validated(valid: Bool)
}

class AuthenticationInteractor: AuthenticationInteractorInput {
    
    // MARK: Properties
    
    weak var presenter: AuthenticationInteractorOutput!
    var loginService: LoginServiceProtocol

    // MARK: Init

    init(loginService: LoginServiceProtocol) {
        self.loginService = loginService
    }
    
    // MARK: Input
    
    func login(username: String?, password: String?) {
        guard let username = username, let password = password else {
            presenter.loginFailed()
            return
        }
        
        if username == "root" && password == "admin" {
            loginService.login()
            presenter.successfulyLoggedIn()
        } else {
            loginService.logedOut()
            presenter.loginFailed()
        }
    }
    
    func validate(username: String?, password: String?) {
        let validationResult = username != nil && username!.count > 3 && password != nil && password!.count > 1
        
        presenter.validated(valid: validationResult)
        
    }
    
}
