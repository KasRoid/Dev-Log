//
//  ViewController.swift
//  NumberCounts_Code
//
//  Created by Kas Song on 2020.04.23.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countLabel = UILabel()
    let btnCount = UIButton(type: .system)
    let btnReset = UIButton(type: .system)
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = String(counter)
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 60)
        countLabel.frame = CGRect(x: 90, y: 200, width: 200, height: 50)
        view.addSubview(countLabel)
        
        btnCount.setTitle("Button", for: .normal)
        btnCount.contentHorizontalAlignment = .center
        btnCount.frame = CGRect(x: 90, y: 530, width: 200, height: 50)
        btnCount.titleLabel?.font =  UIFont.systemFont(ofSize: 30)
        view.addSubview(btnCount)
        btnCount.addTarget(self, action: #selector(btnDidTap(_:)), for: .touchUpInside)
        
        btnReset.setTitle("Reset", for: .normal)
        btnReset.contentHorizontalAlignment = .center
        btnReset.frame = CGRect(x: 90, y: 600, width: 200, height: 50)
        view.addSubview(btnReset)
        btnReset.addTarget(self, action: #selector(btnReset(_:)), for: .touchUpInside)
    }
    
    
    @objc func btnDidTap(_ sender: UIButton) {
        counter += 1
        self.countLabel.text = String(counter)
    }
    
    @objc func btnReset(_ sender: UIButton) {
        counter = 0
        self.countLabel.text = String(counter)
    }

}

