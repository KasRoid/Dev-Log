//
//  ViewController.swift
//  AutoLayout_Additional_Practice
//
//  Created by Kas Song on 2020.05.19.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var toggleBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Toggle Updown", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(toggleBtnAction(_:)), for: .touchUpInside)
        return button
    }()
    var leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    var rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    var leftViewTopAnchor: NSLayoutConstraint!
    var rightViewTopAnchor: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        let safeArea = view.safeAreaLayoutGuide
        
        [toggleBtn, leftView, rightView].forEach { view.addSubview($0) }
        [toggleBtn, leftView, rightView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        toggleBtn.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        toggleBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        leftViewTopAnchor = leftView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150)
        leftViewTopAnchor.isActive = true
        leftView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 75).isActive = true
        leftView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        leftView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        rightViewTopAnchor = rightView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150)
        rightViewTopAnchor.isActive = true
        rightView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -75).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rightView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func toggleBtnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            if self.leftViewTopAnchor.constant == 150 {
                self.leftViewTopAnchor.constant = 600
                self.rightViewTopAnchor.constant = 600
                self.view.layoutIfNeeded()
            }
            else {
                self.leftViewTopAnchor.constant = 150
                self.rightViewTopAnchor.constant = 150
                self.view.layoutIfNeeded()
            }
        }
    }



}

