//
//  FirstViewController.swift
//  MyAlertControllerCode
//
//  Created by Lee on 2019/12/03.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  
  var content = "Display" {
    didSet {
      displayLabel.text = content
    }
  }
  
  private let displayLabel = UILabel()
  private let alertButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    baseUI()
  }
  
  private func baseUI() {
    view.backgroundColor = .white
    
    displayLabel.text = content
    displayLabel.textColor = .white
    displayLabel.textAlignment = .center
    displayLabel.frame.size = CGSize(width: 200, height: 40)
    displayLabel.center = CGPoint(x: view.center.x, y: 200)
    displayLabel.backgroundColor = .black
    view.addSubview(displayLabel)
    
    alertButton.setTitle("Alert", for: .normal)
    alertButton.frame.size = CGSize(width: 200, height: 40)
    alertButton.center = view.center
    alertButton.backgroundColor = .green
    alertButton.addTarget(self, action: #selector(alertButtonAction), for: .touchUpInside)
    view.addSubview(alertButton)
  }
  
  @objc private func alertButtonAction() {
    let secondVC = SecondViewController()
    secondVC.titleLabel.text = "Title"
    secondVC.messageLabel.text = "Message"
    secondVC.modalPresentationStyle = .overFullScreen
    present(secondVC, animated: true
    )
  }
}
