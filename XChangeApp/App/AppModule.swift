//
//  AppModule.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 1/03/22.
//

import UIKit

protocol AppModule {
    func assemble() -> UIViewController?
}

protocol ModuleFactoryProtocol {
    func makeOnboarding(with navigationController: UINavigationController) -> OnboardingModule
    func makeAuthentication(with navigationController: UINavigationController) -> LoginModule
    func makeSignUp(with navigationController: UINavigationController) -> SignUpModule
    func makeFiatExchange(with navigationController: UINavigationController) -> FiatExchangeModule
    func makeTabBar() -> TabBarModule
}

struct ModuleFactory: ModuleFactoryProtocol {
    func makeOnboarding(with navigationController: UINavigationController) -> OnboardingModule {
        let router = OnboardingRouter(navigationController: navigationController, moduleFactory: self)
        let view: OnboardingViewProtocol = OnboardingView()
        return OnboardingModule(view: view, router: router)
    }
    
    func makeAuthentication(with navigationController: UINavigationController) -> LoginModule {
        let router = LoginRouter(navigationController: navigationController, moduleFactory: self)
        let view: LoginViewProtocol = LoginView()
        return LoginModule(view: view, router: router)
    }
    
    func makeSignUp(with navigationController: UINavigationController) -> SignUpModule {
        let router = SignUpRouter(navigationController: navigationController, moduleFactory: self)
        let view: SignUpViewProtocol = SignUpView()
        return SignUpModule(view: view, router: router)
    }
    
    func makeTabBar() -> TabBarModule {
        return TabBarModule()
    }
    
    func makeFiatExchange(with navigationController: UINavigationController) -> FiatExchangeModule {
        let router = FiatExchangeRouter(navigationController: navigationController, moduleFactory: self)
        let view: FiatExchangeViewProtocol = FiatExchangeView()
        return FiatExchangeModule(view: view, router: router)
    }
    
}
