//
//  SignUpPresenter.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 3/03/22.
//

import UIKit

class SignUpPresenter: SignUpPresentable {
    weak var view: SignUpViewProtocol?
    var interactor: SignUpInteractorProtocol
    var router: SignUpRouterProtocol
    
    init(view: SignUpViewProtocol? = nil,
         interactor: SignUpInteractorProtocol = SignUpInteractor(),
         router: SignUpRouterProtocol = SignUpRouter()) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SignUpPresenter: SignUpPresenterViewConfiguration {
    func didSignUpAction() {
        
    }
    
    func didSuccessSignUp() {
        
    }
    
    func didSuccessSignIn() {
        
    }
    
}
