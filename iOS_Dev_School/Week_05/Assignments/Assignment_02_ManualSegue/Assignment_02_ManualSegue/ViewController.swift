//  ViewController.swift
//  Assignment_02_ManualSegue
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
    
    @IBAction func performManualSegue(sender: UIButton) {
        
        switch sender.tag {
        case 0:
            self.performSegue(withIdentifier: "dog", sender: self)
        case 1:
            self.performSegue(withIdentifier: "cat", sender: self)
        default:
            break
        }
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let seconVC = segue.destination as? SecondViewController else { return }
        seconVC.imageName = segue.identifier
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//
//        guard let secondVC = segue.destination as? SecondViewController else {return}
//
//        switch segue.identifier {
//        case "dog":
//            secondVC.image = UIImage(named: "dog.jpg")!
//            dogCount += 1
//            mainLabel.text = String(dogCount)
//        case "cat":
//            secondVC.image = UIImage(named: "cat.jpg")!
//            catCount += 1
//            mainLabel.text = String(catCount)
//        case "bird":
//            secondVC.image = UIImage(named: "bird.jpg")!
//            birdCount += 1
//            mainLabel.text = String(birdCount)
//        default:
//            break
//        }
//    }
    
    @IBAction func unwildToViewControllerSegue(_ unwindSegue: UIStoryboardSegue) {
    }
}
