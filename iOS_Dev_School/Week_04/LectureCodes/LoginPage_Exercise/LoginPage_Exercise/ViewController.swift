//
//  ViewController.swift
//  LoginPage_Exercise
//
//  Created by Kas Song on 2020.04.28.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var idTextField = UITextField()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var loginButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.frame = CGRect(x: 65, y: 150, width: 250, height: 35)
        idTextField.placeholder = "아이디"
        idTextField.font = .preferredFont(forTextStyle: .headline)
        idTextField.borderStyle = .roundedRect
        idTextField.keyboardType = .default
        view.addSubview(idTextField)
        
        emailTextField.frame = CGRect(x: 65, y: 220, width: 250, height: 35)
        emailTextField.placeholder = "이메일"
        emailTextField.font = .preferredFont(forTextStyle: .headline)
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .URL
        view.addSubview(emailTextField)
        
        passwordTextField.frame = CGRect(x: 65, y: 290, width: 250, height: 35)
        passwordTextField.placeholder = "패스워드"
        passwordTextField.font = .preferredFont(forTextStyle: .headline)
        passwordTextField.borderStyle = .roundedRect
        idTextField.keyboardType = .default
        view.addSubview(passwordTextField)
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.frame = CGRect(x: 130, y: 390, width: 100, height: 50)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.sizeToFit()
        view.addSubview(loginButton)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
}
