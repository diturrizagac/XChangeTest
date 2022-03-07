//
//  LoginView.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 2/03/22.
//

import UIKit

class LoginView: UIViewController, LoginViewable {

    var presenter: LoginPresenterProtocol = LoginPresenter()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.applyDefaultDesign()
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.applyDefaultDesign()
        return textField
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.applyButtonDesign()
        button.addTarget(self, action: #selector(didButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.applyTextDesign()
        button.addTarget(self, action: #selector(didButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField,
                                                       passwordTextField,
                                                       signInButton,
                                                       signUpButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private var staticConstraints: [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: [
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 300),
        ])
        return constraints
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        NSLayoutConstraint.activate(staticConstraints)
    }
    
    @objc func didButtonAction(sender: UIButton) {
        switch sender {
        case signInButton:
            presenter.didSignInAction()
        case signUpButton:
            presenter.didSignUpAction()
        default: return
        }
    }
}

extension LoginView: LoginViewConfigurable {
    
}
