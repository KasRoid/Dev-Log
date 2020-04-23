//
//  ViewController.swift
//  HelloWorld
//
//  Created by Kas Song on 2020.04.23.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lableCount: UILabel!
    var counter: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lableCount.text = String(counter)
    }
    
    @IBAction func btnCount(_ sender: UIButton) {
        counter += 1
        self.lableCount.text = String(counter)
    }
    @IBAction func btnReset(_ sender: UIButton) {
        counter = 0
        self.lableCount.text = String(counter)
    }
}
