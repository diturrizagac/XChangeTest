//
//  FiatExchangeRouter.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

final class FiatExchangeRouter {
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
}

extension FiatExchangeRouter: FiatExchangeRouterProtocol {
    func dummyFunc() {
        
    }
}
