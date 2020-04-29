//
//  ViewController.swift
//  LoginPage_Practice
//
//  Created by Kas Song on 2020.04.29.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var result : Array<String> = ["",""]
    var idInputTextField = UITextField()
    var passwordInputTextField = UITextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewUI()
    }
    
    
    func setupInputBoxAttributes(textfield: UITextField, point: CGPoint) {
        textfield.frame.origin = point
        textfield.frame.size = CGSize(width: 200, height: 40)
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        view.addSubview(textfield)
    }
    
    func homeViewUI() {
        
        idInputTextField.placeholder = "ID"
        setupInputBoxAttributes(textfield: idInputTextField, point: CGPoint(x: view.frame.midX - 100, y: 160))
        idInputTextField.addTarget(self, action: #selector(idTextFieldEditingChanged), for: .editingChanged)
        
        passwordInputTextField.placeholder = "Password"
        passwordInputTextField.isSecureTextEntry = true
        setupInputBoxAttributes(textfield: passwordInputTextField, point: CGPoint(x: view.frame.midX - 100, y: 230))
        passwordInputTextField.addTarget(self, action: #selector(passwordTextFieldEditingChanged), for: .editingChanged)
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.backgroundColor = .blue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.frame = CGRect(x: view.frame.midX - 50, y: 330, width: 100, height: 40)
        view.addSubview(loginButton)
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(checkLogin), for: .touchUpInside)
    }
    
    @objc func idTextFieldEditingChanged() {
        result[0] = idInputTextField.text ?? ""
    }
    
    @objc func passwordTextFieldEditingChanged() {
        result[1] = passwordInputTextField.text ?? ""
    }
    
    @objc func checkLogin() {
        guard result[0] == "123" && result[1] == "123" else {
            let alertController = UIAlertController(title: "Error", message: "Check your ID or Password again", preferredStyle: .alert)
            let confirm = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(confirm)
            present(alertController, animated: true)
            return
        }
        let nextVC = LoggedinViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
}

