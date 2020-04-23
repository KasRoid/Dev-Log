//
//  ViewController.swift
//  HelloWorld
//
//  Created by Kas Song on 2020.04.23.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelCount: UILabel!
    var counter: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelCount.text = String(counter)
    }
    
    @IBAction func btnCount(_ sender: UIButton) {
        counter += 1
        self.labelCount.text = String(counter)
    }
    @IBAction func btnReset(_ sender: UIButton) {
        counter = 0
        self.labelCount.text = String(counter)
    }
}
