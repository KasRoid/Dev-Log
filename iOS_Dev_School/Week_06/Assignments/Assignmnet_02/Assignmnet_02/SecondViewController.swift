//
//  SecondViewController.swift
//  Assignmnet_02
//
//  Created by Kas Song on 2020.05.13.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

protocol SecondViewDelegate: class {
    func sendText(data: String)
}

class SecondViewController: UIViewController {
    
    weak var delegate: SecondViewDelegate?
    
    var inputTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size = CGSize(width: 250, height: 40)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.placeholder = "Enter your text here"
        textField.contentVerticalAlignment = .center
        textField.contentHorizontalAlignment = .center
        return textField
    }()
    var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame.size = CGSize(width: 80, height: 40)
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(sendButtonAction(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        inputTextField.frame.origin = CGPoint(x: view.frame.midX - 125, y: view.frame.midY - 100)
        view.addSubview(inputTextField)
        
        sendButton.frame.origin = CGPoint(x: view.frame.midX - 40, y: view.frame.midY)
        view.addSubview(sendButton)
    }
    
    @objc func sendButtonAction(_ sender: UIButton) {
        let firstVC = presentingViewController as? FirstViewController
        self.delegate = firstVC
        if let data = inputTextField.text{
            dismiss(animated: true, completion: {self.delegate?.sendText(data: data)})
        }
    }
}
