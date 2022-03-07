//
//  LoginInteractor.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 2/03/22.
//

import UIKit

class LoginInteractor: LoginInteractable  {
    
    weak var presenter: LoginPresenterProtocol?
    var username: String?
    var rememberUsername: Bool = false
}

extension LoginInteractor: LoginInteractorServiceRequester {
    func login(username: String, password: String) {
        
    }
}

extension LoginInteractor: LoginInteractorCredentialsHandler {

}
