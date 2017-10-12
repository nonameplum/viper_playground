//
//  PersonsDataManager.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import Foundation

enum Result<Value, Error> {
    case success(Value)
    case failure(Error)
}

protocol PersonsDataManagerProtocol: class {
    func getPersons(callback: @escaping (Result<[Person], Error>) -> Void)
}

class PersonsDataManager: PersonsDataManagerProtocol {
    
    func getPersons(callback: @escaping (Result<[Person], Error>) -> Void) {
        let persons = [
            Person(firstName: "Lukas", lastName: "Sliwinski"),
            Person(firstName: "John", lastName: "Smith")]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            callback(.success(persons))
        }
    }
    
}
