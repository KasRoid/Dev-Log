//
//  SecondViewController.swift
//  Assignment_02
//
//  Created by Kas Song on 2020.05.07.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
    }
    
    @IBAction func addOneForAll(_ sender: UIButton) {
        let previousVC = presentingViewController! as? ViewController
        previousVC?.dogCount += 1
        previousVC?.catCount += 1
        previousVC?.birdCount += 1
    }
    
}
