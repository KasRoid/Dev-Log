//
//  LoggedinViewController.swift
//  LoginPage_Practice
//
//  Created by Kas Song on 2020.04.29.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class LoggedinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        pageUI()
    }
    private func pageUI() {
        view.backgroundColor = .white
        
        let welcomeLabel = UILabel()
        welcomeLabel.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 50, width: 200, height: 100)
        welcomeLabel.text = "You made it!!!"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(welcomeLabel)
        
        let goBackButton = UIButton(type: .system)
        goBackButton.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY + 250, width: 200, height: 100)
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.layer.cornerRadius = 20
        view.addSubview(goBackButton)
        goBackButton.addTarget(self, action: #selector(goBackBtn), for: .touchUpInside)
    }
    @objc func goBackBtn() {
        dismiss(animated: true, completion: nil)
    }
}
