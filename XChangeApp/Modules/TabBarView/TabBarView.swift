//
//  TabBarView.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 3/03/22.
//

import UIKit

class TabBarView: UITabBarController, TabBarViewProtocol {
    
    var presenter: TabBarPresenterProtocol = TabBarPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        initUI()
        addViewControllers()
    }
    
    private func initUI() {
        view.backgroundColor = .white
        configureTabBar()
    }
    
    private func configureTabBar() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 3
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .systemBlue
    }
    
    private func addViewControllers() {
        let fiatView = presenter.getFiatExchangeRateView()
        let fiatItem = UITabBarItem(title: "", image: UIImage(named: "icon_cryptocurrency"), selectedImage: UIImage(named: "icon_cryptocurrency"))
        fiatView.tabBarItem = fiatItem

        let cryptoView = CryptoExchangeView()
        let cryptoItem = UITabBarItem(title: "", image: UIImage(named: "icon_crypto"), selectedImage: UIImage(named: "icon_crypto"))
        cryptoView.tabBarItem = cryptoItem
        
        let settingsView = SettingsView()
        let settingsItem = UITabBarItem(title: "", image: UIImage(named: "icon_settings"), selectedImage: UIImage(named: "icon_settings"))
        settingsView.tabBarItem = settingsItem
        
        viewControllers = [fiatView, cryptoView, settingsView]
    }
}

extension TabBarView: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected")
    }
    
}
