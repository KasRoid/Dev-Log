//
//  ViewController.swift
//  CountsWithColor_Code
//
//  Created by Kas Song on 2020.04.23.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countLabel: UILabel = UILabel()
    var btnPlus: UIButton = UIButton(type: .system)
    var btnMinus: UIButton = UIButton(type: .system)
    var btnReset: UIButton = UIButton(type: .system)
    var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = String(counter)
        countLabel.textAlignment = .center
        countLabel.textColor = .black
        countLabel.font = UIFont.systemFont(ofSize: 100)
        countLabel.frame = CGRect(x: 90, y: 200, width: 200, height: 100)
        countLabel.center = view.center
        view.addSubview(countLabel)
        
        btnPlus.setTitle("+", for: .normal)
        btnPlus.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        btnPlus.frame = CGRect(x: 220, y: 520, width: 100, height: 200)
        btnPlus.contentHorizontalAlignment = .center
        view.addSubview(btnPlus)
        btnPlus.addTarget(self, action: #selector(btnPlus(_:)), for: .touchUpInside)
        
        btnMinus.setTitle("-", for: .normal)
        btnMinus.titleLabel?.font = UIFont.systemFont(ofSize: 70)
        btnMinus.frame = CGRect(x: 60, y: 520, width: 100, height: 200)
        btnMinus.contentHorizontalAlignment = .center
        view.addSubview(btnMinus)
        btnMinus.addTarget(self, action: #selector(btnMinus(_:)), for: .touchUpInside)
        
        btnReset.setTitle("reset", for: .normal)
        btnReset.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btnReset.frame = CGRect(x: 140, y: 580, width: 100, height: 200)
        btnReset.contentHorizontalAlignment = .center
        view.addSubview(btnReset)
        btnReset.addTarget(self, action: #selector(btnReset(_:)), for: .touchUpInside)
    }
    
    @objc func btnPlus(_ sender: UIButton) {
        counter += 1
        countLabel.text = String(counter)
        countLabel.textColor = .systemBlue
    }
    @objc func btnMinus(_ sender: UIButton) {
        counter -= 1
        countLabel.text = String(counter)
        countLabel.textColor = .systemRed
    }
    @objc func btnReset(_ sender: UIButton) {
        counter = 0
        countLabel.text = String(counter)
        countLabel.textColor = .black
    }


}

