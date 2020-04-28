//
//  ViewController.swift
//  AlertController_AdditionalPractice
//
//  Created by Kas Song on 2020.04.28.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0 {
        didSet {
            undoNum = oldValue
            labelNumber.text = String(counter)
            labelNumber.sizeToFit()
            labelNumber.center = view.center
        }
    }
    var undoNum = 0
    var memory = 0
    
    var textViewController = UIViewController()
    var btnAdd = UIButton(type: .contactAdd)
    var labelNumber = UILabel()
    var segmentedControl = UISegmentedControl(items: ["Calc", "Text"])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        
        btnAdd.frame.origin = CGPoint(x: view.frame.midX - 13, y: 300)
        btnAdd.tintColor = .magenta
        view.addSubview(btnAdd)
        btnAdd.addTarget(self, action: #selector(btnAdd(_:)), for: .touchUpInside)
        
        labelNumber.text = String(counter)
        labelNumber.font = UIFont.systemFont(ofSize: 30)
        labelNumber.sizeToFit()
        labelNumber.center = view.center
        view.addSubview(labelNumber)
        
        
        segmentedControl.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 60)
        segmentedControl.selectedSegmentTintColor = .systemBlue
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
    }
    
    @objc func didChangeSegmentedController(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            
        }
        
    }
    
    @objc func btnAdd(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Your Choice", message: "Enter or Choose Number", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        
        let addIt = UIAlertAction(title: "Add", style: .default, handler: {
            _ in var placeHolder = 1
            if self.memory != 0 {
                placeHolder = self.memory
                if let i = alertController.textFields?.first,
                    let j = i.text,
                    let k = Int(j) {
                    placeHolder = k
                    }
            }
            else {
                    if let i = alertController.textFields?.first,
                    let j = i.text,
                    let k = Int(j) {
                    placeHolder = k
                        self.memory = placeHolder
                    }
                }
        self.counter += placeHolder
        })
        let undo = UIAlertAction(title: "Undo", style: .default, handler: {
            _ in self.counter = self.undoNum
        })
        let reset = UIAlertAction(title: "Reset", style: .destructive, handler: {
            _ in self.counter = 0
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        for action in [addIt, undo, reset, cancel] {
            alertController.addAction(action)
        }
        present(alertController, animated: true)
    }
}

