//
//  ViewController.swift
//  Frame_Bound_Exercise
//
//  Created by Kas Song on 2020.04.24.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topBlueView: UIView = UIView()
    let bottomBlueView: UIView = UIView()
    let blueView = UIView()
    let greenView = UIView()
    
    let colors: [UIColor] = [.blue, . red, .green]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBlueView.frame = CGRect(x: 15, y: 15, width: view.frame.width - 30, height: 100)
        topBlueView.backgroundColor = .blue
        view.addSubview(topBlueView)
        
        bottomBlueView.frame = CGRect(x: 15, y: view.frame.maxY - 115, width: view.frame.width - 30, height: 100)
        bottomBlueView.backgroundColor = .blue
        view.addSubview(bottomBlueView)
        
        blueView.frame = CGRect(x: 15, y: 15, width: view.frame.width - 30, height: view.frame.height - 30)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
    }
    

}

