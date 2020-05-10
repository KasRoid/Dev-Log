//
//  ViewController.swift
//  SwitchPractice_SB
//
//  Created by Kas Song on 2020.05.08.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Key {
        static var isOn = "isOn"
    }
    
    @IBOutlet weak var imageLoader: UIImageView!
    @IBOutlet weak var imgSelectionSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        imageLoader.image = UIImage(named: "dog.jpg")
    }
    
    @IBAction func imageSelectionSwitch(_ sender: UISwitch) {
        switchFunc()
    }
    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        let isOn = UserDefaults.standard.bool(forKey: Key.isOn)
        imgSelectionSwitch.isOn = isOn
        switchFunc()
    }
    @IBAction func saveBtnAction(_ sender: UIButton) {
        UserDefaults.standard.set(imgSelectionSwitch.isOn, forKey: Key.isOn)
    }
    
    func switchFunc() {
        switch imgSelectionSwitch.isOn {
        case true:
            imageLoader.image = UIImage(named: "dog.jpg")
        default:
            imageLoader.image = UIImage(named: "cat.jpg")
        }
    }
}
