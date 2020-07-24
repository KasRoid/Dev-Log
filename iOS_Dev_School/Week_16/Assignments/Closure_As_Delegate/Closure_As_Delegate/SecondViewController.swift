//
//  SecondViewController.swift
//  Closure_As_Delegate
//
//  Created by Doyoung Song on 7/20/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var stackView = UIStackView(arrangedSubviews: [presentButton, dismissButton])
    let presentButton = UIButton(type: .system)
    let dismissButton = UIButton(type: .system)
    lazy var scrollView = UIScrollView(frame: view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        presentButton.setTitle("Present", for: .normal)
        dismissButton.setTitle("Dismiss", for: .normal)
        [presentButton, dismissButton].forEach {
            $0.addTarget(self, action: #selector(handleButtonAction(_:)), for: .touchUpInside)
        }
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        [
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ].forEach { $0.isActive = true }
        
        view.addSubview(scrollView)
        
        
    }
    
    @objc func handleButtonAction(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "Present":
            let nextVC = ThirdViewController()
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true)
        case "Dismiss":
            dismiss(animated: true, completion: nil)
        default:
            print("Break")
            break
        }
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print(#function)
    }
    
}
