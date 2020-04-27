//
//  ScreenBViewController.swift
//  ViewControllerExercise
//
//  Created by Kas Song on 2020.04.27.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ScreenBViewController: UIViewController {
    
    var labelScreenB = UILabel()
    var buttonToC = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        labelScreenB.text = String("This is Screen B")
        labelScreenB.font = UIFont.systemFont(ofSize: 30)
        labelScreenB.textAlignment = .center
        labelScreenB.frame = CGRect(x: view.frame.midX - 100, y: view.frame.minY + 250, width: 50, height: 50)
        labelScreenB.sizeToFit()
//        labelScreenA.backgroundColor = .red
        view.addSubview(labelScreenB)
        
        buttonToC.setTitle("Go to Screen C", for: .normal)
        buttonToC.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        buttonToC.sizeToFit()
        buttonToC.center = view.center
        view.addSubview(buttonToC)
        buttonToC.addTarget(self, action: #selector(goToScreenC(_:)), for: .touchUpInside)
    }
    @objc func goToScreenC(_ sender: UIButton) {
        let nextVC = ScreenCViewController()
        present(nextVC, animated: true)
    }
}
