//
//  SignUpRouter.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 3/03/22.
//

import UIKit

final class SignUpRouter {
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
}

extension SignUpRouter: SignUpRouterProtocol {
    func showHome() {
        navigationController.pushViewController(TabBarView(), animated: true)
    }
}
