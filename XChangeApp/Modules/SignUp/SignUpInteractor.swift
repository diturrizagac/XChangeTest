//
//  SignUpInteractor.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 3/03/22.
//

import UIKit

class SignUpInteractor: SignUpInteractable {
    var presenter: SignUpPresenterProtocol?

}

extension SignUpInteractor: SignUpInteractorCredentialsHandler {
    func signUp(username: String, password: String) {
        
    }
    
    func signIn(username: String, password: String) {
        
    }
}

extension SignUpInteractor: SignUpInteractorServiceRequester {
   
}
