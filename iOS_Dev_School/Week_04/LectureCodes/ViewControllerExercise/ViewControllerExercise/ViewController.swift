//
//  ViewController.swift
//  ViewControllerExercise
//
//  Created by Kas Song on 2020.04.27.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var labelScreenA = UILabel()
    var buttonToB = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelScreenA.text = String("This is Screen A")
        labelScreenA.font = UIFont.systemFont(ofSize: 30)
        labelScreenA.textAlignment = .center
        labelScreenA.frame = CGRect(x: view.frame.midX - 100, y: view.frame.minY + 250, width: 50, height: 50)
        labelScreenA.sizeToFit()
//        labelScreenA.backgroundColor = .red
        view.addSubview(labelScreenA)
        
        buttonToB.setTitle("Go to Screen B", for: .normal)
        buttonToB.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        buttonToB.sizeToFit()
        buttonToB.center = view.center
        view.addSubview(buttonToB)
        buttonToB.addTarget(self, action: #selector(goToScreenB(_:)), for: .touchUpInside)
    }
    @objc func goToScreenB(_ sender: UIButton) {
        let nextVC = ScreenBViewController()
        present(nextVC, animated: true)
    }

}

