//
//  AppDependecies.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 03/10/2017.
//  Copyright © 2017 Łukasz Śliwiński. All rights reserved.
//

import Foundation

protocol hasAppContext {
    var appContext: AppContext { get }
}

protocol HasPersonalDataManager {
    var personsDataManager: PersonsDataManager { get }
}

protocol HasLoginService {
    var loginService: LoginService { get }
}

class AppDependencies: hasAppContext, HasPersonalDataManager, HasLoginService {

    let appContext = AppContext()
    let personsDataManager = PersonsDataManager()
    lazy var loginService: LoginService = LoginService(appContext: self.appContext)

}
