//
//  ViewController.swift
//  CountsWithColor_SB
//
//  Created by Kas Song on 2020.04.23.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0
    
    @IBOutlet weak var labelNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelNumber.textAlignment = .center
        labelNumber.center = view.center
    }
    @IBAction func btnMinus(_ sender: UIButton) {
        counter -= 1
        labelNumber.text = String(counter)
        labelNumber.textColor = .systemRed
    }
    
    @IBAction func btnPlus(_ sender: UIButton) {
        counter += 1
        labelNumber.text = String(counter)
        labelNumber.textColor = .systemBlue
    }
    
}

