//
//  FirstViewController.swift
//  Assignment_03
//
//  Created by Kas Song on 2020.05.13.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var textInput: UITextField = {
        let text = UITextField()
        text.placeholder = "Enter your text"
        text.borderStyle = .roundedRect
        text.frame.size = CGSize(width: 250, height: 40)
        return text
    }()
    var enterBtn: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .gray
        button.frame.size = CGSize(width: 80, height: 40)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        textInput.frame.origin = CGPoint(x: view.frame.midX - 125, y: view.frame.midY - 80)
        view.addSubview(textInput)
        
        enterBtn.frame.origin = CGPoint(x: view.frame.midX - 45, y: view.frame.midY)
        view.addSubview(enterBtn)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let anotherVC = SecondViewController()
        anotherVC.delegate = self // 위임
        if textInput.text != nil {
            present(anotherVC, animated: true)
        }
    }
}

extension FirstViewController: SecondViewDelegate { // 채택
    func receiveText() -> String { // 준수
        guard let data = textInput.text else {
            return ""
        }
            return data
    }
}
