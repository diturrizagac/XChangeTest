//
//  LoginPresenter.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 2/03/22.
//

import UIKit

final class LoginPresenter: LoginPresentable {
    
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol
    var router: LoginRouterProtocol
    
    init(view: LoginViewProtocol? = nil,
         interactor: LoginInteractorProtocol = LoginInteractor(),
         router: LoginRouterProtocol = LoginRouter()) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension LoginPresenter: LoginPresenterViewConfiguration {
    func didSignInAction() {
        router.showHome()
    }
    
    func didSignUpAction() {
        router.showSignUp()
    }
    
    func didSuccessLogin() {
        router.showHome()
    }
}
