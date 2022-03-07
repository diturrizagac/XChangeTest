//
//  LoginModule.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 2/03/22.
//

import UIKit

class LoginModule {
    private var view: LoginViewProtocol?
    private var router: LoginRouterProtocol
    private var presenter: LoginPresenterProtocol
        
    init(view: LoginViewProtocol = LoginView(),
         router: LoginRouterProtocol = LoginRouter(),
         presenter: LoginPresenterProtocol = LoginPresenter()) {
        self.view = view
        self.router = router
        self.presenter = presenter
    }
}

extension LoginModule: AppModule {
    func assemble() -> UIViewController? {
        presenter.view = view
        presenter.router = router
        view?.presenter = presenter
        return view as? UIViewController
    }
}
