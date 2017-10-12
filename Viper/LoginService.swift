//
//  LoginService.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 11/10/2017.
//  Copyright © 2017 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol LoginServiceLogoutDelegateProtocol: class {
    func didLogout()
}

protocol LoginServiceProtocol: class {
    var logoutDelegate: LoginServiceLogoutDelegateProtocol? { get set }
    var isLoggedIn: Bool { get }
    func login()
    func logedOut()
}

class LoginService: LoginServiceProtocol {

    weak var logoutDelegate: LoginServiceLogoutDelegateProtocol?
    let appContext: AppContext

    init(appContext: AppContext) {
        self.appContext = appContext
    }

    var isLoggedIn: Bool {
        return appContext.isLoggedIn
    }

    func login() {
        self.appContext.isLoggedIn = true
    }

    func logedOut() {
        self.appContext.isLoggedIn = false
        logoutDelegate?.didLogout()
    }
    
}
