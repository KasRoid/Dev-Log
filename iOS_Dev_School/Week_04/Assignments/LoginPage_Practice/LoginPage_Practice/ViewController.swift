//
//  ViewController.swift
//  LoginPage_Practice
//
//  Created by Kas Song on 2020.04.29.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeViewUI()
    }
    func setupInputBoxAttributes(textfield: UITextField, point: CGPoint) {
        textfield.frame.origin = point
        textfield.frame.size = CGSize(width: 200, height: 40)
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        view.addSubview(textfield)
    }
    
    private func homeViewUI() {
        let idInputTextField = UITextField()
        setupInputBoxAttributes(textfield: idInputTextField, point: CGPoint(x: view.frame.midX - 100, y: 90))
        
        let passwordInputTextField = UITextField()
        setupInputBoxAttributes(textfield: passwordInputTextField, point: CGPoint(x: view.frame.midX - 100, y: 160))
    }

}

