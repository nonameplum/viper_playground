//
//  UsersInteractor.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol UsersInteractorInput: class {
    func getAllPersons()
    func logout()
}

protocol UsersInteractorOutput: class {
    func providedUsers(users: [Person])
    func showError()
}

class UsersInteractor: UsersInteractorInput {
    
    // MARK: Properties
    
    weak var presenter: UsersInteractorOutput!
    let apiDataManager: PersonsDataManagerProtocol
    let loginService: LoginServiceProtocol
    
    // MARK: Initialization
    
    init(apiDataManager: PersonsDataManagerProtocol, loginService: LoginServiceProtocol) {
        self.apiDataManager = apiDataManager
        self.loginService = loginService
    }
    
    // MARK: Input
    
    func getAllPersons() {
        apiDataManager.getPersons { (result) in
            switch result {
            case .success(let persons):
                self.presenter.providedUsers(users: persons)
            case .failure(_):
                self.presenter.showError()
            }
        }
    }

    func logout() {
        loginService.logedOut()
    }
    
}
