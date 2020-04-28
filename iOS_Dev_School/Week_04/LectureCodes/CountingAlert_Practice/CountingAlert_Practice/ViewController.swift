//
//  ViewController.swift
//  CountingAlert_Practice
//
//  Created by Kas Song on 2020.04.28.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let countingButton = UIButton(type: .contactAdd)
    let numberLabel = UILabel()
    var counter = 0 {
        didSet {
            numberLabel.text = String(counter)
            numberLabel.sizeToFit()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countingButton.frame.origin = CGPoint(x: view.frame.midX - 12, y: 200)
        view.addSubview(countingButton)
        countingButton.addTarget(self, action: #selector(countingButton(_:)), for: .touchUpInside)
        
        numberLabel.text = String(counter)
        numberLabel.font = UIFont.systemFont(ofSize: 50)
        numberLabel.sizeToFit()
        numberLabel.center = view.center
        view.addSubview(numberLabel)
    }
    
    
    @objc func countingButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Alert", message: "Choose an option", preferredStyle: .alert)
        alert.addTextField()
        
        let addOne = UIAlertAction(title: "Add One", style: .default) {_ in var addValue = 1
            
            if let textField = alert.textFields?.first,
                let inputValue = textField.text,
                let number = Int(inputValue) {
                addValue = number
            }
            self.counter += addValue
            
        }
        let reset = UIAlertAction(title: "Reset", style: .destructive) {
            _ in self.counter = 0;
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(addOne)
        alert.addAction(cancel)
        alert.addAction(reset)
        
        present(alert, animated: true)
        
//        alertController.addTextField
//        alertController.textFields?.first
    }
}


//alertController.addTextField {
//  $0.placeholder = "정수 값을 입력하세요."
//}
//
//let okAction = UIAlertAction(title: "Add Count", style: .default) { _ in
//  var addValue = 1
//
//  if let textField = alertController.textFields?.first,
//    let inputValue = textField.text,
//    let number = Int(inputValue) {
//    addValue = number
//  }
//  self.count += addValue
//  print("Add count \(addValue)")
//}
