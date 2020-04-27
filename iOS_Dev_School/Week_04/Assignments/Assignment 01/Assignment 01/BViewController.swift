//
//  BViewController.swift
//  Assignment 01
//
//  Created by Kas Song on 2020.04.27.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

var labelB = UILabel()

class BViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    var btnToA = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.presentationController?.delegate = self
        
        view.backgroundColor = .lightGray
        
        labelB.text = String(counter)
        labelB.font = UIFont.systemFont(ofSize: 80)
        labelB.frame = CGRect(x: 180, y: 200, width: 50, height: 50)
        labelB.sizeToFit()
        labelB.textAlignment = .center
        labelB.center = view.center
        view.addSubview(labelB)
        
        btnToA.setTitle("Go to Screen A", for: .normal)
        btnToA.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btnToA.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY + 150, width: 50, height: 50)
        btnToA.sizeToFit()
        view.addSubview(btnToA)
        btnToA.addTarget(self, action: #selector(goToScreenA(_:)) , for: .touchUpInside)
    }
    
    @objc func goToScreenA(_ sender: UIButton) {
//        counter += 1
//        labelA.text = String(counter)
//        labelA.sizeToFit()
//        labelA.center = view.center
        dismiss(animated: true)
    }
        
//    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
//        counter += 1
//        labelA.text = String(counter)
//        print("dismissed")
//        dismiss(animated: true)
//    }
    
//    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
//        print("Attemped")
//        dismiss(animated: true)
//    }
    
    override func viewDidDisappear(_ animated: Bool) {
        counter += 1
        labelA.text = String(counter)
        labelA.sizeToFit()
        labelA.center = view.center
    }

}
