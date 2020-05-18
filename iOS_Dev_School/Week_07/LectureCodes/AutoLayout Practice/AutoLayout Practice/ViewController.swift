//
//  ViewController.swift
//  AutoLayout Practice
//
//  Created by Kas Song on 2020.05.18.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var upperLocation: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func toggleBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            if self.upperLocation.priority != UILayoutPriority(997) {
                self.upperLocation.priority = UILayoutPriority(997)
                self.view.layoutIfNeeded()
            }
            else {
                self.upperLocation.priority = UILayoutPriority(999)
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

