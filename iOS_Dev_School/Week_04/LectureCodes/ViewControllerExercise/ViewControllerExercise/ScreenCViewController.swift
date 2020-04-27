//
//  ScreenCViewController.swift
//  ViewControllerExercise
//
//  Created by Kas Song on 2020.04.27.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ScreenCViewController: UIViewController {
    
    var labelScreenC = UILabel()
    var buttonToA = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        labelScreenC.text = String("This is Screen C")
        labelScreenC.font = UIFont.systemFont(ofSize: 30)
        labelScreenC.textAlignment = .center
        labelScreenC.frame = CGRect(x: view.frame.midX - 100, y: view.frame.minY + 250, width: 50, height: 50)
        labelScreenC.sizeToFit()
//        labelScreenA.backgroundColor = .red
        view.addSubview(labelScreenC)
        
        buttonToA.setTitle("Go to Screen A", for: .normal)
        buttonToA.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        buttonToA.sizeToFit()
        buttonToA.center = view.center
        view.addSubview(buttonToA)
        buttonToA.addTarget(self, action: #selector(goToScreenA(_:)), for: .touchUpInside)
    }
    @objc func goToScreenA(_ sender: UIButton) {
        presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
}
