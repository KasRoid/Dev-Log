//
//  ViewController.swift
//  UITextAddExample
//
//  Created by Kas Song on 2020.04.28.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin.setTitle("Log In", for: .normal)
        btnLogin.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btnLogin.sizeToFit()
        btnLogin.center = view.center
        btnLogin.frame.origin = CGPoint(x: view.frame.midX - 40, y: view.frame.midY + 70)
        btnLogin.tintColor = .brown
        
        idTextField.frame = CGRect(x: 30, y: 80, width: 300, height: 40)
        idTextField.placeholder = "ID 입력"
        idTextField.font = .preferredFont(forTextStyle: .headline)
        idTextField.textAlignment = .center
        
        idTextField.keyboardType = .URL
        idTextField.borderStyle = .roundedRect
        view.addSubview(idTextField)
        
        idTextField.addTarget(self, action: #selector(textFieldEditingDidBegin(_:)), for: .editingDidBegin)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idTextField.becomeFirstResponder()
//        idTextField.resignFirstResponder()
//        view.endEditing(true)
    }

    
    @IBAction func textFieldEditingDidBegin(_ sender: UITextField) {
        print("1. Text field editing did begin")
    }
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        print("2. changed")
    }
    @IBAction func primaryActionDidEndTriggered(_ sender: UITextField) {
        print("3. triggered")
    }
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        print("4. did end on Exit")
    }
    @IBAction func didEnd(_ sender: UITextField) {
        print("5. did end")
    }
}

