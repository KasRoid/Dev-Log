//
//  ViewController.swift
//  practice
//
//  Created by Kas Song on 2020.05.08.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    var counter = ["Dog": 0, "Cat": 0, "Bird": 0] {
        didSet {
            countLabel.text = "\(counter["Dog"]!), \(counter["Cat"]!), \(counter["Bird"]!)"
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        let title = (sender as? UIButton)?.currentTitle?.lowercased()
        
        
        var limit = [7, 9, 14]
        
        switch <#value#> {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
    }
}

