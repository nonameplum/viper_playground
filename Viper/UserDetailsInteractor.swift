//
//  UserDetailsInteractor.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/26/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol UserDetailsInteractorInput: class {
    func saveUser(firstName: String?, lastName: String?)
    func validate(firstName: String?, lastName: String?)
}

protocol UserDetailsInteractorOutput: class {
    func userSaved(user: Person)
    func validated(valid: Bool)
}

class UserDetailsInteractor: UserDetailsInteractorInput {
    
    // MARK: Properties
    
    weak var preseneter: UserDetailsInteractorOutput!
    
    // MARK: Input
    
    func saveUser(firstName: String?, lastName: String?) {
        guard let firstName = firstName else { return }
        
        preseneter.userSaved(user: Person(firstName: firstName, lastName: lastName))
    }
    
    func validate(firstName: String?, lastName: String?) {
        let validationResult = firstName != nil && firstName!.characters.count > 1
        
        preseneter.validated(valid: validationResult)
    }

}
