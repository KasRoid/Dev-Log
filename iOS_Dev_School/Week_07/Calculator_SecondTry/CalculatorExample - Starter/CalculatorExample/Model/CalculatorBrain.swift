//
//  CalculatorBrain.swift
//  CalculatorExample
//
//  Created by Kas Song on 2020.05.20.
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var numberInput = "" {
        didSet {
            connectInputInString()
        } // 스트링을 자동으로 연결해주는 함수 적용
    }
    var operatorInput = ""
    var storeLastOperator = ""
    var previousNumberInString = ""
    var displayOnScreen = ""
    
    mutating func connectInputInString() {
        var placeHolder = ""
        if operatorInput == "-" && displayOnScreen == "" { // 최초에 마이너스 기호를 입력받았을 경우
            displayOnScreen += "-"
            operatorInput = "" // 다음 연산자를 정상적으로 입력받기 위하여 연산자 저장변수 초기화
            print("Negative Value activated")
        }
        else if operatorInput != "" { // 연산자를 입력받았을 경우
            guard let value = numberInput.last else {
                print("connectFunc_Guard Activated : No value in numberInput")
                return
            }
            previousNumberInString = displayOnScreen // 추후 연산을 위하여 입력되어 있던 값을 저장
            placeHolder = String(value) // 새로운 input 을 받기 전에 현재 입력받은 값을 잠시 저장
            displayOnScreen = ""
            numberInput = "" // 새롭게 input 을 받을 수 있도록 변수 초기화
            storeLastOperator = operatorInput // operatorInput 을 초기화 전에 저장
            operatorInput = ""
            print("Previous Number: \(previousNumberInString)")
        }
        
        displayOnScreen += numberInput // 입력받은 숫자를 이어붙여서 저장
        
        if placeHolder != "" { // placeHolder 에 있는 값을 저장
            displayOnScreen += placeHolder
            placeHolder = ""
        }
        print("DisplayNum: ", displayOnScreen)
    }
    
    mutating func calculate() {
        if operatorInput == "=" {
            if previousNumberInString.isEmpty { // 12 + = 24 실행을 위한 코드
                previousNumberInString = displayOnScreen
            }
            guard let previousValue = Double(previousNumberInString), let currentValue = Double(displayOnScreen) else {
                print("Calculate func_Guard Activated")
                return
            }
            switch storeLastOperator {
            case "+":
                displayOnScreen = String(previousValue + currentValue)
            case "-":
                displayOnScreen = String(previousValue - currentValue)
            case "×":
                displayOnScreen = String(previousValue * currentValue)
            case "÷":
                displayOnScreen = String(previousValue / currentValue)
            default:
                numberInput = ""
                print(" = calculate_else_There is no operator.")
                return // 다른거 시도해보려고 임시로 적었는데 갑자기 버그가 다 잡힘...
            }
            operatorInput = "" // 초기화
            storeLastOperator = ""
        }
        else if operatorInput != "" { // '=' 을 제외한 다른 모든 연산자가 할당되어 있을 경우
            guard let previousValue = Double(previousNumberInString), let currentValue = Double(displayOnScreen) else {
                print("Calculate func_Guard Activated")
                return
            }
            switch storeLastOperator {
            case "+":
                displayOnScreen = String(previousValue + currentValue)
            case "-":
                displayOnScreen = String(previousValue - currentValue)
            case "×":
                displayOnScreen = String(previousValue * currentValue)
            case "÷":
                displayOnScreen = String(previousValue / currentValue)
            default:
                print("calculate_else_There is no operator.")
            }
            storeLastOperator = ""
        }
        else {
            print("Fatal Error")
        }
    }
}
