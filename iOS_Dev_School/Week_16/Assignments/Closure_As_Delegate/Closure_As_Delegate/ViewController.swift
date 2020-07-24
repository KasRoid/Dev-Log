//
//  ViewController.swift
//  Closure_As_Delegate
//
//  Created by Doyoung Song on 7/20/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let customView = CustomView()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        customView.btnActionHandler = btnhActionHandler
        label.text = "Text"
        
        view.addSubview(customView)
        view.addSubview(label)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        [
            customView.topAnchor.constraint(equalTo: view.topAnchor),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ].forEach { $0.isActive = true }
        
        [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: customView.centerYAnchor, constant: -45)
            ].forEach { $0.isActive = true }
    }
    
    private func btnhActionHandler() {
        let nextVC = SecondViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }

}

