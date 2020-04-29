//
//  ViewController.swift
//  AlertController_Additional_Exercise
//
//  Created by Kas Song on 2020.04.29.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var labelDisplay = UILabel()
    var storeText: String = "" {
        didSet {
            labelDisplay.text = storeText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewUI()
    }
    
    private func homeViewUI() {
        view.backgroundColor = .white
        
        let nextButton = UIButton()
//        nextButton.frame = CGRect(x: view.center.x - 50, y: 300, width: 100, height: 40)
        nextButton.frame.size = CGSize(width: 100, height: 40)
        nextButton.frame.origin = CGPoint(x: view.frame.midX - 50, y: 500)
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = .blue
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        view.addSubview(nextButton)
        
        labelDisplay.frame = CGRect(x: view.frame.midX - 100, y: 200, width: 200, height: 40)
        labelDisplay.textAlignment = .center
        labelDisplay.layer.borderWidth = 0.5
        view.addSubview(labelDisplay)
    }
    
    @objc private func nextButtonAction() {
        let vc = AlertViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}

