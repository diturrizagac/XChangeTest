//
//  TabBarRouter.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

class TabBarRouter {
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
}

extension TabBarRouter: TabBarRouterProtocol {
    func getFiatExchangeRate() -> UIViewController {
        let module = moduleFactory.makeFiatExchange(with: navigationController)
        return module.assemble() ?? UIViewController()
    }
    
    func getCryptoExchange() -> UIViewController {
        return CryptoExchangeView()
    }
    
    func getExchangeSettings() -> UIViewController {
        return SettingsView()
    }
    
}
