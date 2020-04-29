//
//  ViewController.swift
//  Assignment 02
//
//  Created by Kas Song on 2020.04.28.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var textInput = UITextField() {
        didSet {
            resultLabel.text = textInput.text
        }
    }
    var resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textInput.frame = CGRect(x: 40, y: 400, width: 300, height: 50)
        textInput.borderStyle = .roundedRect
        textInput.textAlignment = .center
        textInput.delegate = self
        textInput.placeholder = "Enter your text here"
        view.addSubview(textInput)
        textInput.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: UIControl.Event.editingDidBegin)
        textInput.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: UIControl.Event.editingChanged)
        textInput.addTarget(self, action: #selector(textFieldDidEndOnExit(_:)), for: UIControl.Event.editingDidEndOnExit)
        textInput.addTarget(self, action: #selector(textFieldEditingDidEnd(_:)), for: UIControl.Event.editingDidEnd)
        
        resultLabel.frame = CGRect(x: 40, y: 200, width: 300, height: 50)
        resultLabel.layer.borderColor = UIColor.lightGray.cgColor
        resultLabel.layer.borderWidth = 2.0
        resultLabel.textAlignment = .center
        view.addSubview(resultLabel)
    }
    
    @objc func textFieldDidBeginEditing(_ sender: UITextField) {
        resultLabel.textColor = .systemBlue
        resultLabel.font = UIFont.systemFont(ofSize: 40)
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
//                resultLabel.text = textInput.text
    }
    
    @objc func textFieldDidEndOnExit(_ textField: UITextField) {
        
    }
    
    @objc func textFieldEditingDidEnd(_ textField: UITextField) {
        resultLabel.textColor = .systemRed
        resultLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      let maxLength = 10
      let currentString: NSString = textField.text! as NSString
      let newString: NSString =
        currentString.replacingCharacters(in: range, with: string) as NSString
      return newString.length <= maxLength
    }
}

