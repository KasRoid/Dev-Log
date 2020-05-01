//
//  ViewController.swift
//  Exam01
//
//  Created by Kas Song on 2020.05.01.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var moneyOwned: Int = 70000
    var totalPayment: Int = 0 {
        didSet {
            totalPaymentLabel.text = String(totalPayment)
        }
    }
    var quantityOfJjajang: Int = 0 {
        didSet {
            quantityOfJjajangLabel.text = String(quantityOfJjajang)
        }
    }
    var quantityOfJjambbong: Int = 0 {
        didSet {
            quantityOfJjambbongLabel.text = String(quantityOfJjambbong)
        }
    }
    var quantityOfTangsuyuck: Int = 0 {
        didSet {
            quantityOfTangsuyuckLabel.text = String(quantityOfTangsuyuck)
        }
    }
    
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceOfJjajangLabel: UILabel!
    @IBOutlet weak var priceOfJjambbongLabel: UILabel!
    @IBOutlet weak var priceOfTangsuyuckLabel: UILabel!
    @IBOutlet weak var jjajangLabel: UILabel!
    @IBOutlet weak var jjambbongLabel: UILabel!
    @IBOutlet weak var tangsuyuckLabel: UILabel!
    @IBOutlet weak var quantityOfJjajangLabel: UILabel!
    @IBOutlet weak var quantityOfJjambbongLabel: UILabel!
    @IBOutlet weak var quantityOfTangsuyuckLabel: UILabel!
    
    let moneyOwnedLabel = UILabel()
    let totalPaymentLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseUI()
    }
    
    func labelCommonAttributes (label: UILabel, text: String, origin: CGPoint) {
        label.text = text
        label.frame.origin = origin
        label.frame.size = CGSize(width: 85, height: 45)
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        view.addSubview(label)
    }
    
    func btnCommonAttributes (button: UIButton, title: String, origin: CGPoint) {
        button.frame.origin = origin
        button.setTitle(title, for: .normal)
        button.frame.size = CGSize(width: 85, height: 45)
        button.backgroundColor = .systemOrange
        view.addSubview(button)
    }
    
    func baseUI() {
        let moneyOwnedTitleLabel = UILabel()
        labelCommonAttributes(label: moneyOwnedTitleLabel, text: "소지금", origin: CGPoint(x: view.frame.midX - 185, y: view.frame.midY - 100))
        
        let totalPaymentTitleLabel = UILabel()
        labelCommonAttributes(label: totalPaymentTitleLabel, text: "결제금액", origin: CGPoint(x: view.frame.midX - 185, y: view.frame.midY - 35))
        
        // moneyOwnedLabel
        labelCommonAttributes(label: moneyOwnedLabel, text: String(moneyOwned), origin: CGPoint(x: view.frame.midX - 80, y: view.frame.midY - 100))
        
        // totalPaymentLabel
        labelCommonAttributes(label: totalPaymentLabel, text: String(totalPayment), origin: CGPoint(x: view.frame.midX - 80, y: view.frame.midY - 35))
        
        let moneyOwnedResetButton = UIButton()
        btnCommonAttributes(button: moneyOwnedResetButton, title: "초기화", origin: CGPoint(x: view.frame.maxX - 105, y: view.frame.midY - 100))
        moneyOwnedResetButton.addTarget(self, action: #selector(moneyOwnedResetButtonFunction), for: .touchUpInside)
        
        let payButton = UIButton()
        btnCommonAttributes(button: payButton, title: "결제", origin: CGPoint(x: view.frame.maxX - 105, y: view.frame.midY - 35))
        payButton.addTarget(self, action: #selector(payButtonFunction), for: .touchUpInside)
    }
    
    @IBAction func jjajangOrder(_ sender: UIButton) {
        quantityOfJjajang += 1
        totalPayment += 5000
    }
    @IBAction func jjambbongOrder(_ sender: UIButton) {
        quantityOfJjambbong += 1
        totalPayment += 6000
    }
    @IBAction func tangsuyuckOrder(_ sender: UIButton) {
        quantityOfTangsuyuck += 1
        totalPayment += 12000
    }
    
    @objc func moneyOwnedResetButtonFunction () {
        totalPayment = 0
        moneyOwned = 70000
        moneyOwnedLabel.text = String(moneyOwned)
        
        self.quantityOfJjajang = 0
        self.quantityOfJjambbong = 0
        self.quantityOfTangsuyuck = 0
    }
    
    @objc func payButtonFunction () {
        guard totalPayment <= moneyOwned else {
            let alertController = UIAlertController(title: "경고", message: "소지금액이 부족합니다.", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alertController.addAction(confirmAction)
            present(alertController, animated: true)
            return
        }
        let alertController = UIAlertController(title: "정말 결제하시겠습니까?", message: "총 결제금액은 \(totalPayment)원 입니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: {_ in
            self.moneyOwned -= self.totalPayment
            self.moneyOwnedLabel.text = String(self.moneyOwned)
            self.totalPayment = 0
            
            self.quantityOfJjajang = 0
            self.quantityOfJjambbong = 0
            self.quantityOfTangsuyuck = 0
        })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
