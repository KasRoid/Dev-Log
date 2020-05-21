//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var numberZero: UIButton!
    @IBOutlet weak var numberOne: UIButton!
    @IBOutlet weak var numberTwo: UIButton!
    @IBOutlet weak var numberThree: UIButton!
    @IBOutlet weak var numberFour: UIButton!
    @IBOutlet weak var numberFive: UIButton!
    @IBOutlet weak var numberSix: UIButton!
    @IBOutlet weak var numberSeven: UIButton!
    @IBOutlet weak var numberEight: UIButton!
    @IBOutlet weak var numberNine: UIButton!
    @IBOutlet weak var symbolAdd: UIButton!
    @IBOutlet weak var symbolSubtract: UIButton!
    @IBOutlet weak var symbolMultiply: UIButton!
    @IBOutlet weak var symbolDivide: UIButton!
    @IBOutlet weak var symbolEqual: UIButton!
    @IBOutlet weak var btnReset: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    buttonActionAdded()
    updateUI()
  }
    
    func buttonActionAdded() {
        [numberZero, numberOne, numberTwo, numberThree, numberFour, numberFive, numberSix, numberSeven, numberEight, numberNine, symbolAdd, symbolSubtract, symbolMultiply, symbolDivide, symbolEqual, btnReset].forEach { $0?.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside) }
    }
    func updateUI() {
        [numberZero, numberOne, numberTwo, numberThree, numberFour, numberFive, numberSix, numberSeven, numberEight, numberNine, symbolAdd, symbolSubtract, symbolMultiply, symbolDivide, symbolEqual, btnReset].forEach { ($0)?.layer.cornerRadius = 45 }
        
        displayLabel.adjustsFontSizeToFitWidth = true
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal //.spellout
        formatter.minimumFractionDigits = 0 // 최소 소수점 단위
        formatter.maximumFractionDigits = 3 // 최대 소수점 단위
        
        if let value = Double(calculatorBrain.displayOnScreen) {
            displayLabel.text = formatter.string(from: value as NSNumber)
        }
        if displayLabel.text == "" { // 만약 레이블의 값이 없을 경우 0 으로 표시
            displayLabel.text = "0"
        }
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else {
            print("No title label")
            return
        }
        switch title {
        case "+", "-", "×", "÷", "=":
            calculatorBrain.operatorInput = title
            calculatorBrain.calculate()
            if title != "=" { // 12 + = 24 실행을 위한 코드
                calculatorBrain.storeLastOperator = title
            }
            calculatorBrain.opreationCounter += 1
            print("Current Operater: ", calculatorBrain.operatorInput)
            updateUI()
        case "AC":
            calculatorBrain.numberInput = ""
            calculatorBrain.operatorInput = ""
            calculatorBrain.storeLastOperator = ""
            calculatorBrain.previousNumberInString = ""
            calculatorBrain.displayOnScreen = ""
            displayLabel.text = ""
            calculatorBrain.opreationCounter = 0
            calculatorBrain.negativeAvailable = true
            print("Button AC pressed")
            updateUI()
        default:
            calculatorBrain.numberInput = title
            calculatorBrain.opreationCounter = 0
            print("Current numberInput: ", calculatorBrain.numberInput)
            calculatorBrain.negativeAvailable = false
            updateUI()
        }
    }
}
