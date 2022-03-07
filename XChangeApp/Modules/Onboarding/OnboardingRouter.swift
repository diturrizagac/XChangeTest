//
//  OnboardingRouter.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 1/03/22.
//

import UIKit

final class OnboardingRouter {
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
}

extension OnboardingRouter: OnboardingRouterProtocol {
    func showLogin() {
        let module = moduleFactory.makeAuthentication(with: navigationController)
        if let viewController = module.assemble() {
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}
