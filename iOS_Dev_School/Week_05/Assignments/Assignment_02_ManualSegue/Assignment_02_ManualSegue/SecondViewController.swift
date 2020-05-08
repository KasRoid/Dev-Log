//
//  SecondViewController.swift
//  Assignment_02_ManualSegue
//
//  Created by Kas Song on 2020.05.07.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage()
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageView.image = UIImage(named: "dog.jpg")
        imageView.image = UIImage(named: imageName!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
