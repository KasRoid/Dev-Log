//
//  SignupViewController.swift
//  LoginPage_Exercise
//
//  Created by Kas Song on 2020.05.14.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    var containerView: UIView = {
        let view = UIView()
        return view
    }()
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 300, height: 100)
        label.text = "회원가입을 환영합니다!"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.layer.borderColor = UIColor.lightGray.cgColor
        return label
    }()
    
    // textFields
    let textFieldSize = CGSize(width: 250, height: 40)
    lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size = textFieldSize
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.placeholder = "ID"
        textField.contentVerticalAlignment = .center
        textField.contentHorizontalAlignment = .center
        textField.keyboardType = UIKeyboardType.emailAddress
        return textField
    }()
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size = textFieldSize
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.placeholder = "Password"
        textField.contentVerticalAlignment = .center
        textField.contentHorizontalAlignment = .center
        textField.keyboardType = UIKeyboardType.default
        return textField
    }()
    
    // buttons
    let buttonSize = CGSize(width: 100, height: 40)
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame.size = buttonSize
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 5.0
        button.addTarget(self, action: #selector(cancelButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame.size = buttonSize
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 5.0
        button.addTarget(self, action: #selector(confirmButtonPressed(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateUI()
    }
    
    func updateUI() {
        // containerView
        containerView.frame.origin = CGPoint(x: 0, y: 200)
        containerView.frame.size = CGSize(width: view.frame.width, height: 400)
        view.addSubview(containerView)
        
        // label
        welcomeLabel.frame.origin = CGPoint(x: 60, y: 0)
        containerView.addSubview(welcomeLabel)
        
        // textFields
        idTextField.frame.origin = CGPoint(x: (containerView.frame.midX - 75) - 50, y: 130)
        containerView.addSubview(idTextField)
        passwordTextField.frame.origin = CGPoint(x: (containerView.frame.midX - 75) - 50, y: 210)
        containerView.addSubview(passwordTextField)
        
        // buttons
        cancelButton.frame.origin = CGPoint(x: (containerView.frame.midX - 75) - 50, y: 300)
        containerView.addSubview(cancelButton)
        confirmButton.frame.origin = CGPoint(x: (containerView.frame.midX - 75) + 100, y: 300)
        containerView.addSubview(confirmButton)
    }

    @objc func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    @objc func confirmButtonPressed(_ sender: UIButton) {
        if let id = idTextField.text {
            if id == "" {
                let typeIDAlert = UIAlertController(title: "경고", message: "아이디를 입력해주세요", preferredStyle: UIAlertController.Style.alert)
                let confirmAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                typeIDAlert.addAction(confirmAction)
                present(typeIDAlert, animated: true, completion: nil)
                print("No ID")
            }
            else if id.count <= 3 {
                let typeIDAlert = UIAlertController(title: "경고", message: "아이디를 4자 이상 입력해주세요", preferredStyle: UIAlertController.Style.alert)
                let confirmAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                typeIDAlert.addAction(confirmAction)
                present(typeIDAlert, animated: true, completion: nil)
            }
            else {
                if let pw = passwordTextField.text {
                    if pw == "" {
                        let typeIDAlert = UIAlertController(title: "경고", message: "비밀번호를 입력해주세요", preferredStyle: UIAlertController.Style.alert)
                        let confirmAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                        typeIDAlert.addAction(confirmAction)
                        present(typeIDAlert, animated: true, completion: nil)
                        print("No PW")
                    }
                    else if pw.count <= 3 {
                        let typeIDAlert = UIAlertController(title: "경고", message: "비밀번호를 4자 이상 입력해주세요", preferredStyle: UIAlertController.Style.alert)
                        let confirmAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                        typeIDAlert.addAction(confirmAction)
                        present(typeIDAlert, animated: true, completion: nil)
                        print("No PW")
                    }
                    else {
                        let typeIDAlert = UIAlertController(title: "가입완료", message: "정상적으로 가입되었습니다", preferredStyle: UIAlertController.Style.alert)
                        let confirmAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: {ACTION in self.presentingViewController?.dismiss(animated: true)})
                        typeIDAlert.addAction(confirmAction)
                        present(typeIDAlert, animated: true, completion: nil)
                        print(id, pw)
                        loginBrain.signupAction(id: id, pw: pw)
                        print(loginBrain.userInfo)
                    }
                }
            }
        }
    }
}
