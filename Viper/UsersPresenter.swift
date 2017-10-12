//
//  UsersPresenter.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol UsersPresenterInput: UsersViewControllerOutput, UsersInteractorOutput {
    
}

class UsersPresenter: UsersPresenterInput {
    
    // MARK: Properties
    
    weak var view: UsersViewControllerInput!
    var interactor: UsersInteractorInput
    var router: UsersRoutingInput
    
    // MARK: Initialization
    
    init(view: UsersViewControllerInput, interactor: UsersInteractorInput, router: UsersRoutingInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: UsersViewControllerOutput
    
    func fetchUsers() {
        view.changeLoadingState(isLoading: true)
        interactor.getAllPersons()
    }
    
    func showUserDetails() {
        router.navigateToUserDetails()
    }
    
    func close() {
        interactor.logout()
    }

}

extension UsersPresenter: UsersInteractorOutput {

    func providedUsers(users: [Person]) {
        view.changeLoadingState(isLoading: false)
        view.displayFetchedUsers(users)
    }

    func showError() {
        view.displayError(message: "Error occured during fetching users")
    }

}

extension UsersPresenter: UserDetailsPresenterDelegate {
    
    func savedUser(user: Person) {
        view.displayAddedUser(user: user)
    }
    
}
