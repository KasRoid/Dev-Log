
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // declare struct for calculation
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal //.spellout
        formatter.minimumFractionDigits = 0 // 최소 소수점 단위
        formatter.maximumFractionDigits = 3 // 최대 소수점 단위
        
        let numString = formatter.string(from: Int(calculatorBrain.currentlyDisplayingNumber)! as NSNumber)
        mainLabel.text = numString!
        
//        for num in [1000, 1000.0, 1000.123, 1000.123456] {
//            let numString = formatter.string(from: num as NSNumber)
//        }
    }
    
    // numbers
    @IBAction func numberZeroAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 0
        updateUI()
    }
    @IBAction func numberOneAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 1
        updateUI()
    }
    @IBAction func numberTwoAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 2
        updateUI()
    }
    @IBAction func numberThreeAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 3
        updateUI()
    }
    @IBAction func numberFourAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 4
        updateUI()
    }
    @IBAction func numberFiveAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 5
        updateUI()
    }
    @IBAction func numberSixAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 6
        updateUI()
    }
    @IBAction func numberSevenAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 7
        updateUI()
    }
    @IBAction func numberEightAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 8
        updateUI()
    }
    @IBAction func numberNineAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 9
        updateUI()
    }
    
    // symbols
    @IBAction func symbolAddAction(_ sender: UIButton) {
        calculatorBrain.buttonOperator = "+"
        calculatorBrain.saveValue()
        calculatorBrain.operatorPlaceHolder = "+"
        updateUI()
    }
    @IBAction func symbolSubtractAction(_ sender: UIButton) {
        calculatorBrain.buttonOperator = "-"
        calculatorBrain.saveValue()
        calculatorBrain.operatorPlaceHolder = "-"
        updateUI()
    }
    @IBAction func symbolMultiplyAction(_ sender: UIButton) {
        calculatorBrain.buttonOperator = "×"
        calculatorBrain.saveValue()
        calculatorBrain.operatorPlaceHolder = "×"
        updateUI()
    }
    @IBAction func symbolDivideAction(_ sender: UIButton) {
        calculatorBrain.buttonOperator = "÷"
        calculatorBrain.saveValue()
        calculatorBrain.operatorPlaceHolder = "÷"
        updateUI()
    }
    @IBAction func symbolEqualAction(_ sender: UIButton) {
        calculatorBrain.calculate()
        calculatorBrain.operatorPlaceHolder = "="
        updateUI()
    }
    @IBAction func resetButtonAction(_ sender: UIButton) {
        calculatorBrain.firstNumberPlaceHolder = 0
        calculatorBrain.buttonOperator = ""
        calculatorBrain.numberInString = ""
        calculatorBrain.operatorPlaceHolder = ""
        updateUI()
    }
}
