//
//  FirstViewController.swift
//  Assignmnet_02
//
//  Created by Kas Song on 2020.05.13.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var mainLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 250, height: 40)
        label.text = ""
        label.textAlignment = .center
        label.layer.borderWidth = 2.0
        label.layer.borderColor = UIColor.lightGray.cgColor
        return label
    }()
    var mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame.size = CGSize(width: 80, height: 40)
        button.setTitle("Go!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        mainLabel.frame.origin = CGPoint(x: view.frame.midX - 125, y: view.frame.midY - 20)
        view.addSubview(mainLabel)
        
        mainButton.frame.origin = CGPoint(x: view.frame.midX - 40, y: view.frame.midY + 40)
        view.addSubview(mainButton)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let secondVC = SecondViewController()
        secondVC.view.backgroundColor = .white
        present(secondVC, animated: true, completion: nil)
    }

}

extension FirstViewController: SecondViewDelegate {
    func sendText(data: String) {
        mainLabel.text = data
        print("extension working")
    }
}
