//
//  ViewController.swift
//  Assignment 02
//
//  Created by Kas Song on 2020.04.28.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textInput = UITextField()
    var resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textInput.frame = CGRect(x: 50, y: 400, width: 250, height: 50)
        textInput.borderStyle = .roundedRect
        view.addSubview(textInput)
        textInput.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: UIControl.Event.editingDidBegin)
        textInput.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: UIControl.Event.editingChanged)
        
        resultLabel.frame = CGRect(x: 50, y: 200, width: 250, height: 50)
        resultLabel.backgroundColor = .lightGray
        view.addSubview(resultLabel)
    }
    
    @objc func textFieldDidBeginEditing(_ sender: UITextField) {
        resultLabel.textColor = .systemBlue
        resultLabel.font = UIFont.systemFont(ofSize: 40)
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        resultLabel.text = textInput.text
    }
    
    @objc func textFieldEditingDidEnd(_ textField: UITextField) {
        resultLabel.textColor = .systemRed
        resultLabel.font = UIFont.systemFont(ofSize: 20)
    }
}
