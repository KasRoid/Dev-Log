//
//  ViewController.swift
//  SwitchPractice
//
//  Created by Kas Song on 2020.05.08.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dog.jpg")
        image.contentMode = .scaleAspectFit
        return image
    }()
    var pirctureSwitch: UISwitch = {
        let swtich = UISwitch()
        swtich.isOn = false
        swtich.addTarget(self, action: #selector(imageSwitch), for: .touchUpInside)
        return swtich
    }()
    var resetBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.sizeToFit()
        button.addTarget(self, action: #selector(resetBtnFunc), for: .touchUpInside)
        return button
    }()
    var saveBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.sizeToFit()
        button.addTarget(self, action: #selector(saveBtnFunc), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        imageView.frame = CGRect(x: view.frame.midX - 150, y: view.frame.midY - 150, width: 300, height: 300)
        view.addSubview(imageView)
        
        pirctureSwitch.frame.origin = CGPoint(x: view.frame.midX - 20, y: view.frame.midY + 220)
        view.addSubview(pirctureSwitch)
        
        saveBtn.frame = CGRect(x: 30, y: 100, width: 150, height: 150)
        view.addSubview(saveBtn)
        
        resetBtn.frame = CGRect(x: view.frame.maxX - 150, y: 100, width: 150, height: 150)
        view.addSubview(resetBtn)
    }
    
    @objc func imageSwitch() {
        switch pirctureSwitch.isOn {
        case true:
            imageView.image = UIImage(named: "cat.jpg")
        default:
            imageView.image = UIImage(named: "dog.jpg")
        }
    }
    
    @objc func saveBtnFunc() {
        UserDefaults.standard.set(pirctureSwitch.isOn, forKey: "switch")
    }
    
    @objc func resetBtnFunc() {
        let switchStatus = UserDefaults.standard.bool(forKey: "switch")
        pirctureSwitch.isOn = switchStatus
    }
    
}

