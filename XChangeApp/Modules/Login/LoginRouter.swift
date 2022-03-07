//
//  LoginRouter.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 2/03/22.
//

import UIKit

final class LoginRouter {
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
}

extension LoginRouter: LoginRouterProtocol {
    func showHome() {
        let module = moduleFactory.makeTabBar()
        if let viewController = module.assemble() {
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    func showSignUp() {
        let module = moduleFactory.makeSignUp(with: navigationController)
        if let viewController = module.assemble() {
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}
