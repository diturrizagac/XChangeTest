//
//  TabBarPresenter.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

class TabBarPresenter {
    var router: TabBarRouterProtocol
    
    init(router: TabBarRouterProtocol = TabBarRouter()) {
        self.router = router
    }
}

extension TabBarPresenter: TabBarPresenterProtocol {
    func getFiatExchangeRateView() -> UIViewController {
        router.getFiatExchangeRate()
    }
    
    func getCryptoExchangeView() -> UIViewController {
        router.getFiatExchangeRate()
    }
    
    func getExchangeSettingsView() -> UIViewController {
        router.getExchangeSettings()
    }
}

extension TabBarPresenter {
    
}
