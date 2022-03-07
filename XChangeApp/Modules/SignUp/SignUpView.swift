//
//  SignUpView.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 3/03/22.
//

import UIKit

class SignUpView: UIViewController {
    
    var presenter: SignUpPresenterProtocol = SignUpPresenter()
    
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
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        textField.applyDefaultDesign()
        return textField
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.applyButtonDesign()
        button.addTarget(self, action: #selector(didButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField,
                                                       passwordTextField,
                                                       confirmPasswordTextField,
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
    
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        NSLayoutConstraint.activate(staticConstraints)
    }
    
    @objc func didButtonAction(sender: UIButton) {
        switch sender {
        case signUpButton:
            presenter.didSignUpAction()
        default: return
        }
    }
}

extension SignUpView: SignUpViewConfigurable, SignUpViewable {
    
}

extension SignUpView {
    private func setupUI() {
        NSLayoutConstraint.activate(staticConstraints)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stackView)
    }
}
