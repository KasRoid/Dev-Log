//
//  ViewController.swift
//  Switch_On_Off
//
//  Created by Kas Song on 2020.04.24.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mySwitch = UISwitch()
    var myLable = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLable.text = "OFF"
        myLable.frame = CGRect(x: view.frame.maxX - 270, y: view.frame.maxY - 600, width: 150, height: 150)
        myLable.font = UIFont.systemFont(ofSize: 60)
        myLable.textAlignment = .center
        view.addSubview(myLable)
        
        mySwitch.frame = CGRect(x: view.frame.maxX - 220, y: view.frame.maxY - 300, width: 100, height: 100)
        view.addSubview(mySwitch)
        mySwitch.addTarget(self, action: #selector(statusSwitcher(_:)), for: .valueChanged)
        
        
    }
    @objc func statusSwitcher(_ sender: UIButton) {
        switch myLable.text {
        case "ON":
            myLable.text = "OFF"
        default:
            myLable.text = "ON"
        }
    }

}

