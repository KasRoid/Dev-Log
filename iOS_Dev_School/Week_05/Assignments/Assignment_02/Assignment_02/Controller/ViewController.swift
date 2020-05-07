//
//  ViewController.swift
//  Assignment_02
//
//  Created by Kas Song on 2020.05.07.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var dogCount = 0
    var catCount = 0
    var birdCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let secondVC = segue.destination as? SecondViewController else {return}
        
        switch segue.identifier {
        case "dog":
            secondVC.image = UIImage(named: "dog.jpg")!
            dogCount += 1
            mainLabel.text = String(dogCount)
        case "cat":
            secondVC.image = UIImage(named: "cat.jpg")!
            catCount += 1
            mainLabel.text = String(catCount)
        case "bird":
            secondVC.image = UIImage(named: "bird.jpg")!
            birdCount += 1
            mainLabel.text = String(birdCount)
        default:
            break
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "dog" && dogCount > 7 {
            return false
        }
        else if identifier == "cat" && catCount > 9 {
            return false
        }
        else if identifier == "bird" && birdCount > 14 {
            return false
        }
        else {
            return true
        }
    }
    
    @IBAction func unwindToSecondViewController(_ unwindSegue: UIStoryboardSegue) {
    }
    
}

