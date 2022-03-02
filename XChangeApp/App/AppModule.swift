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
    func makeAuthentication(with navigationController: UINavigationController) -> OnboardingModule
    //func makeAuthentication(using navigationController: UINavigationController) -> AuthenticationModule
    
    
    /*func makeLogin(using navigationController: UINavigationController) -> LoginModule
    func makePlayerList(using navigationController: UINavigationController) -> PlayerListModule
    func makePlayerDetails(using navigationController: UINavigationController,
                           for player: PlayerResponseModel,
                           delegate: PlayerDetailDelegate) -> PlayerDetailModule
    func makePlayerEdit(using navigationController: UINavigationController,
                        for playerEditable: PlayerEditable,
                        delegate: PlayerEditDelegate) -> PlayerEditModule
    func makePlayerAdd(using navigationController: UINavigationController, delegate: PlayerAddDelegate) -> PlayerAddModule
    func makeConfirmPlayers(using navigationController: UINavigationController,
                            playersDictionary: [TeamSection: [PlayerResponseModel]],
                            delegate: ConfirmPlayersDelegate) -> ConfirmPlayersModule
    func makeGather(using navigationController: UINavigationController,
                    gather: GatherModel,
                    delegate: GatherDelegate) -> GatherModule*/
}

struct ModuleFactory: ModuleFactoryProtocol {
    func makeOnboarding(with navigationController: UINavigationController) -> OnboardingModule {
        let router = OnboardingRouter(navigationController: navigationController, moduleFactory: self)
        let view: OnboardingView = OnboardingView()
        return OnboardingModule(view: view, router: router)
    }
    
    func makeAuthentication(with navigationController: UINavigationController) -> OnboardingModule {
        let router = OnboardingRouter(navigationController: navigationController, moduleFactory: self)
        let view: OnboardingView = OnboardingView()
        return OnboardingModule(view: view, router: router)
    }
    
}
