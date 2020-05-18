//
//  ViewController.swift
//  AutoLayout_Code_Exercise
//
//  Created by Kas Song on 2020.05.18.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var toggleBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Toggle", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(toggleAction(_:)), for: .touchUpInside)
        return button
    }()
    
    // 두가지 이상의 함수에서 사용해야하기 때문에 미리 선언이 필요하다.
    var rectangleViewTopAnchor: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        [rectangleView, toggleBtn].forEach { view.addSubview($0) }
        [rectangleView, toggleBtn].forEach { $0.translatesAutoresizingMaskIntoConstraints = false}
        
        let safeArea = view.safeAreaLayoutGuide
        
        rectangleViewTopAnchor = rectangleView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100)
        rectangleViewTopAnchor.isActive = true
        rectangleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rectangleView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        rectangleView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        toggleBtn.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30).isActive = true
        toggleBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func toggleAction(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            if self.rectangleViewTopAnchor.constant != 500 {
                self.rectangleViewTopAnchor.constant = 500
                self.view.layoutIfNeeded()
            }
            else {
                self.rectangleViewTopAnchor.constant = 100
                self.view.layoutIfNeeded()
            }
        }
    }
}
