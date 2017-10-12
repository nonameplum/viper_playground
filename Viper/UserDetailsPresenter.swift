//
//  UserDetailsPresenter.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/26/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol UserDetailsPresenterInput: UserDetailsViewControllerOutput, UserDetailsInteractorOutput {
    
}

protocol UserDetailsPresenterDelegate: class {
    func savedUser(user: Person)
}

class UserDetailsPresenter: UserDetailsPresenterInput {
    
    // MARK: Properties
    
    weak var view: UserDetailsViewControllerInput!
    var interactor: UserDetailsInteractorInput
    var router: UserDetailsRoutingInput
    weak var delegate: UserDetailsPresenterDelegate?
    
    // MARK: Initialization
    
    init(view: UserDetailsViewControllerInput, interactor: UserDetailsInteractorInput, router: UserDetailsRoutingInput, delegate: UserDetailsPresenterDelegate?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegate = delegate
    }
    
    // MARK: UserDetailsViewControllerOutput
    
    func saveUser(firstName: String?, lastName: String?) {
        interactor.saveUser(firstName: firstName, lastName: lastName)
    }
    
    func validateForm(firstName: String?, lastName: String?) {
        interactor.validate(firstName: firstName, lastName: lastName)
    }
    
    func showInfo() {
        router.navigateToInfo()
    }
    
    // MARK: UserDetailsInteractorOutput
    
    func userSaved(user: Person) {
        router.navigateBackToUsers()
        delegate?.savedUser(user: user)
    }
    
    func validated(valid: Bool) {
        view.setSaveButtonEnabledState(enabled: valid)
    }
    
}
