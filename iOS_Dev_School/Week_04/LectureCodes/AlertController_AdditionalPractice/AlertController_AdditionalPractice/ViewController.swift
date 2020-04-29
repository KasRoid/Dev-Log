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
    
    var textView = UIView()
    var inputText = UITextField()
    var labelText = UITextView()
    
    
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
        
        
        let segmentedControlFont = UIFont.systemFont(ofSize: 14)
        segmentedControl.frame = CGRect(x: view.frame.midX - 110, y: 40, width: view.frame.width - 150, height: 30)
        segmentedControl.selectedSegmentTintColor = .systemBlue
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: segmentedControlFont], for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(didChangeSegmentedController(_:)), for: .valueChanged)
        
        // Text Page
        textView.frame = CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height)
        textView.backgroundColor = .white
        textView.alpha = 0
        view.addSubview(textView)
        
        inputText.borderStyle = .roundedRect
        inputText.alpha = 0
        inputText.frame = CGRect(x: 20, y: view.frame.midY, width: view.frame.width - 40, height: 40)
        inputText.textAlignment = .center
        inputText.placeholder = "Enter Your Text Here"
        view.addSubview(inputText)
        inputText.addTarget(self, action: #selector(textFieldEditingBegin(_:)), for: .editingDidBegin)
        inputText.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        labelText.font = UIFont.systemFont(ofSize: 16)
        labelText.textAlignment = .center
        labelText.layer.borderColor = UIColor.lightGray.cgColor
        labelText.layer.borderWidth = 2.0
        labelText.frame = CGRect(x: 20, y: view.frame.midY - 200, width: view.frame.width - 40, height: 40)
        labelText.alpha = 0
        view.addSubview(labelText)
    }
    
    // 화면 전환 관리
    @objc func didChangeSegmentedController(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            textView.alpha = 0
            inputText.alpha = 0
            labelText.alpha = 0
        }
        else if sender.selectedSegmentIndex == 1 {
            textView.alpha = 1
            inputText.alpha = 1
            labelText.alpha = 1
        }
    }
    
    // 실시간 텍스트 입력 함수 설정
    @objc func textFieldEditingBegin(_ sender: UITextField) {
    }
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        labelText.text = inputText.text
    }
    @objc func primaryActionDidEndTriggered(_ sender: UITextField) {
    }
    @objc func textFieldDidEndOnExit (_ sender: UITextField) {
    }
    @objc func textFieldEditingDidEnd(_ sender: UITextField) {
    }
    
    // 텍스트 필드 바로 입력모드
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
//            inputText.becomeFirstResponder()
    }
    
    
    // Calc 버튼 함수
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

