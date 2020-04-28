//
//  ViewController.swift
//  LoginPage_Practice
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
        
        idTextField.frame = CGRect(x: 10, y: 10, width: 200, height: 30)
        idTextField.placeholder = "아이디"
        idTextField.font = .preferredFont(forTextStyle: .headline)
        view.addSubview(idTextField)
    }


}

