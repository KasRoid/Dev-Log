//
//  SecondViewController.swift
//  Assignment_03
//
//  Created by Kas Song on 2020.05.13.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

protocol SecondViewDelegate: class { // 정의
    func receiveText() -> String
}

class SecondViewController: UIViewController {
    
    var resultLabel: UILabel = {
        var label = UILabel()
        label.text = "My Label"
        label.textAlignment = .center
        label.frame.size = CGSize(width: 250, height: 40)
        return label
    }()
    
    weak var delegate: SecondViewDelegate? // 등록

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        updateUI()
        updateLabel()
    }
    
    func updateUI() {
        resultLabel.frame.origin = CGPoint(x: view.frame.midX - 125, y: view.frame.midY - 20)
        resultLabel.layer.borderColor = UIColor.lightGray.cgColor // border 색 설정
        resultLabel.layer.borderWidth = 2.0
        view.addSubview(resultLabel)
    }
    func updateLabel() {
        resultLabel.text = delegate?.receiveText() // 처리
    }
}
