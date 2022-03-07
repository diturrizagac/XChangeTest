//
//  TabBarModule.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

class TabBarModule {
    private var view: TabBarViewProtocol?
    private var router: TabBarRouterProtocol
    private var presenter: TabBarPresenterProtocol
        
    init(view: TabBarViewProtocol = TabBarView(),
         router: TabBarRouterProtocol = TabBarRouter(),
         presenter: TabBarPresenterProtocol = TabBarPresenter()) {
        self.view = view
        self.router = router
        self.presenter = presenter
    }
}

extension TabBarModule: AppModule {
    func assemble() -> UIViewController? {
        presenter.router = router
        view?.presenter = presenter
        return view as? UIViewController
    }
}
