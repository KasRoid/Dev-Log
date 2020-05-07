//
//  SecondViewController.swift
//  StoryboardExample
//
//  Created by Kas Song on 2020.05.07.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var subtractingTextField: UITextField!
    @IBOutlet private weak var textLabel: UILabel!
    
    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToSecondViewController(_ unwindSegue: UIStoryboardSegue) {
    }

}

// guard let number = Int(sender.text ?? "0") else { return }
