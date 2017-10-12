//
//  ModuleFactory.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 29/09/2017.
//  Copyright © 2017 Łukasz Śliwiński. All rights reserved.
//

import UIKit

public struct ModuleFactory<View: UIViewController> {
    private let handler: () -> View

    public init(handler: @escaping () -> View) {
        self.handler = handler
    }

    func instantiateViewController() -> View {
        return handler()
    }
}

protocol ModuleBuilder {
    func buildAuthenticationModuleFactory() -> ModuleFactory<AuthenticationViewController>
    func usersModuleFactory() -> ModuleFactory<UsersViewController>
    func buildUserDetailsModuleFactory(delegate: UserDetailsPresenterDelegate?) -> ModuleFactory<UserDetailsViewController>
    func buildInfoModuleFactory() -> ModuleFactory<InfoViewController>
}

class AppModuleBuilder: ModuleBuilder {

    private var appDependencies: AppDependencies
    
    init(appDependencies: AppDependencies) {
        self.appDependencies = appDependencies
    }

    func buildAuthenticationModuleFactory() -> ModuleFactory<AuthenticationViewController> {
        return ModuleFactory(handler: { () -> AuthenticationViewController in
            let viewController = AuthenticationViewController.loadFromStoryboard()
            let interactor = AuthenticationInteractor(loginService: self.appDependencies.loginService)
            let router = AuthenticationRouting(viewController: viewController, moduleBuilder: self)
            let presenter = AuthenticationPresenter(view: viewController, interactor: interactor, router: router)

            viewController.presenter = presenter
            interactor.presenter = presenter
            return viewController
        })
    }

    func usersModuleFactory() -> ModuleFactory<UsersViewController> {
        return ModuleFactory(handler: { () -> UsersViewController in
            let viewController = UsersViewController.loadFromStoryboard()
            let router = UsersRouting(viewController: viewController, moduleBuilder: self)
            let interactor = UsersInteractor(apiDataManager: self.appDependencies.personsDataManager, loginService: self.appDependencies.loginService)
            let presenter = UsersPresenter(view: viewController, interactor: interactor, router: router)
            
            viewController.presenter = presenter
            interactor.presenter = presenter
            return viewController
        })
    }

    func buildUserDetailsModuleFactory(delegate: UserDetailsPresenterDelegate?) -> ModuleFactory<UserDetailsViewController> {
        return ModuleFactory(handler: { () -> UserDetailsViewController in
            let viewController = UserDetailsViewController.loadFromStoryboard()
            let router = UserDetailsRouting(viewController: viewController, moduleBuilder: self)
            let interactor = UserDetailsInteractor()
            let presenter = UserDetailsPresenter(view: viewController, interactor: interactor, router: router, delegate: delegate)

            viewController.presenter = presenter
            interactor.preseneter = presenter
            return viewController
        })
    }

    func buildInfoModuleFactory() -> ModuleFactory<InfoViewController> {
        return ModuleFactory(handler: { () -> InfoViewController in
            let viewController = InfoViewController.loadFromStoryboard()
            let router = InfoRouting(viewController: viewController)
            let presenter = InfoPresenter(router: router)

            viewController.presenter = presenter
            return viewController
        })
    }

}
