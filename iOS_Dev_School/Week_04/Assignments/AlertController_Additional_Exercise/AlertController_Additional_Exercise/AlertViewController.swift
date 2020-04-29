//
//  AlertViewController.swift
//  AlertController_Additional_Exercise
//
//  Created by Kas Song on 2020.04.29.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    var alertStyleView = UIView()
    var labelTitle = UILabel()
    var labelMessage = UILabel()
    var inputText = UITextField()
    var btnEnter = UIButton(type: .system)
    var btnCancel = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertStyleViewUI()
    }
    
    private func alertStyleViewUI() {
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        
        alertStyleView.frame = CGRect(x: view.frame.midX - 125, y: view.frame.midY - 150, width: 250, height: 200)
        alertStyleView.backgroundColor = UIColor.white
        view.addSubview(alertStyleView)
        
        inputText.frame = CGRect(x: 25, y: 80, width: 200, height: 50)
        inputText.borderStyle = .roundedRect
        alertStyleView.addSubview(inputText)
        
        btnCancel.setTitle("Cancel", for: .normal)
        btnCancel.sizeToFit()
        btnCancel.frame.origin = CGPoint(x: 40, y: alertStyleView.frame.height - 50)
        alertStyleView.addSubview(btnCancel)
        btnCancel.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        
        btnEnter.setTitle("Enter", for: .normal)
        btnEnter.sizeToFit()
        btnEnter.frame.origin = CGPoint(x: alertStyleView.frame.width - 75, y: alertStyleView.frame.height - 50)
        alertStyleView.addSubview(btnEnter)
        btnEnter.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        
        
        labelTitle.text = "Title"
        labelTitle.sizeToFit()
        labelTitle.textColor = .black
        labelTitle.frame.origin = CGPoint(x: 110, y: 30)
        alertStyleView.addSubview(labelTitle)
    }
    
    @objc func btnAction(_ sender: UIButton) {
        switch sender {
        case btnCancel:
            break
        default:
            guard let vc = presentingViewController as? ViewController else {
                return
            }
            vc.storeText = inputText.text ?? ""
        }
        dismiss(animated: true, completion: nil)
    }
}
