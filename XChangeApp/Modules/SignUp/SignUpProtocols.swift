//
//  SignUpProtocols.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 3/03/22.
//

import UIKit

// MARK: - View
typealias SignUpViewProtocol = SignUpViewable & SignUpViewConfigurable

protocol SignUpViewable: AnyObject {
    var presenter: SignUpPresenterProtocol { get set }
}

protocol SignUpViewConfigurable: AnyObject {
    
}

// MARK: - Interactor
typealias SignUpInteractorProtocol = SignUpInteractable & SignUpInteractorServiceRequester & SignUpInteractorCredentialsHandler

protocol SignUpInteractable: AnyObject {
    var presenter: SignUpPresenterProtocol? { get set }
}

protocol SignUpInteractorServiceRequester: AnyObject {
    func signUp(username: String, password: String)
    func signIn(username: String, password: String)
}

protocol SignUpInteractorCredentialsHandler: AnyObject {
    
}

// MARK: - Presenter
typealias SignUpPresenterProtocol = SignUpPresentable & SignUpPresenterViewConfiguration

protocol SignUpPresentable: AnyObject {
    var view: SignUpViewProtocol? { get set }
    var interactor: SignUpInteractorProtocol { get set }
    var router: SignUpRouterProtocol { get set }
}

protocol SignUpPresenterViewConfiguration: AnyObject {
    func didSignUpAction()
    func didSuccessSignUp()
    func didSuccessSignIn()
}

protocol SignUpPresenterServiceInteractable: AnyObject {
    func performSignIn()
    func performRegister()
}

protocol SignUpPresenterServiceHandler: AnyObject {
    func didSignInFailure(_ error: Error)
    func didSignInSuccess()
}


// MARK: - Router
protocol SignUpRouterProtocol: AnyObject {
    func showHome()
}
