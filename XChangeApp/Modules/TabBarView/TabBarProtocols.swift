//
//  TabBarProtocols.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    var presenter: TabBarPresenterProtocol { get set }
}

protocol TabBarPresenterProtocol: AnyObject {
    var router: TabBarRouterProtocol { get set }
    
    func getFiatExchangeRateView() -> UIViewController
    func getCryptoExchangeView() -> UIViewController
    func getExchangeSettingsView() -> UIViewController
}

protocol TabBarRouterProtocol: AnyObject {
    func getFiatExchangeRate() -> UIViewController
    func getCryptoExchange() -> UIViewController
    func getExchangeSettings() -> UIViewController
}
