//
//  SignUpModule.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 3/03/22.
//

import UIKit

class SignUpModule {
    private var view: SignUpViewProtocol?
    private var router: SignUpRouterProtocol
    private var presenter: SignUpPresenterProtocol
        
    init(view: SignUpViewProtocol = SignUpView(),
         router: SignUpRouterProtocol = SignUpRouter(),
         presenter: SignUpPresenterProtocol = SignUpPresenter()) {
        self.view = view
        self.router = router
        self.presenter = presenter
    }
}

extension SignUpModule: AppModule {
    func assemble() -> UIViewController? {
        presenter.view = view
        presenter.router = router
        view?.presenter = presenter
        return view as? UIViewController
    }
}
