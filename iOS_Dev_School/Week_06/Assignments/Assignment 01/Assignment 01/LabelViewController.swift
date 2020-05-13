//
//  LabelViewController.swift
//  Assignment 01
//
//  Created by Kas Song on 2020.05.12.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController, CustomViewDelegate {
    
    var resultLabel: UILabel = {
        var label = UILabel()
        label.text = "My Label"
        label.textAlignment = .center
        label.frame.size = CGSize(width: 250, height: 40)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let viewController = presentingViewController as! ViewController
//        viewController.delegate = self
        view.backgroundColor = .systemBackground
        updateUI()
    }
    
    func updateUI() {
        resultLabel.frame.origin = CGPoint(x: view.frame.midX - 175, y: view.frame.midY - 20)
        resultLabel.layer.borderColor = UIColor.lightGray.cgColor // border 색 설정
        resultLabel.layer.borderWidth = 2.0
        view.addSubview(resultLabel)
    }
    
    func sendText(data: String) {
        resultLabel.text = data
    }

}
