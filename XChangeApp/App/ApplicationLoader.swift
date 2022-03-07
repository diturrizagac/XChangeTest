//
//  ApplicationLoader.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 1/03/22.
//

import UIKit

struct ApplicationLoader {
    private let window: UIWindow
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds),
         navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.window = window
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }

    func build() {
        let module: AppModule = isFirstTime ? moduleFactory.makeOnboarding(with: navigationController) : moduleFactory.makeAuthentication(with: navigationController)
        let viewController = module.assemble()
        setRootViewController(viewController)
    }
    
    private var isFirstTime: Bool {
        if !UserDefaults.standard.bool(forKey: "test") {
            UserDefaults.standard.set(true, forKey: "test")
            UserDefaults.standard.synchronize()
            return true
        }
        return false
    }
    
    private func setRootViewController(_ viewController: UIViewController?) {
        window.rootViewController = navigationController
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: true)
        }
        window.makeKeyAndVisible()
    }
}
