//
//  LoginProtocols.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 2/03/22.
//

import UIKit

// MARK: - View
typealias LoginViewProtocol = LoginViewable & LoginViewConfigurable

protocol LoginViewable: AnyObject {
    var presenter: LoginPresenterProtocol { get set }
}

protocol LoginViewConfigurable: AnyObject {
    
}

// MARK: - Interactor
typealias LoginInteractorProtocol = LoginInteractable & LoginInteractorServiceRequester & LoginInteractorCredentialsHandler

protocol LoginInteractable: AnyObject {
    var presenter: LoginPresenterProtocol? { get set }
}

protocol LoginInteractorServiceRequester: AnyObject {
    func login(username: String, password: String)
}

protocol LoginInteractorCredentialsHandler: AnyObject {
}

// MARK: - Presenter
typealias LoginPresenterProtocol = LoginPresentable & LoginPresenterViewConfiguration

protocol LoginPresentable: AnyObject {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorProtocol { get set }
    var router: LoginRouterProtocol { get set }
}

protocol LoginPresenterViewConfiguration: AnyObject {
    func didSignInAction()
    func didSignUpAction()
    func didSuccessLogin()
}

protocol LoginPresenterServiceInteractable: AnyObject {
    func performSignIn()
    func performRegister()
}

protocol LoginPresenterServiceHandler: AnyObject {
    func didSignInFailure(_ error: Error)
    func didSignInSuccess()
}


// MARK: - Router
protocol LoginRouterProtocol: AnyObject {
    func showHome()
    func showSignUp()
}
