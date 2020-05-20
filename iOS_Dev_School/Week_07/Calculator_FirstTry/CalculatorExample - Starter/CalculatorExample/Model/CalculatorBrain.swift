//
//  CalculatorBrain.swift
//  CalculatorExample
//
//  Created by Kas Song on 2020.05.19.
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var currentlyDisplayingNumber = "0"
    
    // 숫자를 입력받으면 combineDigits 함수를 사용하여 계산 후 numberInString 에 할당한다.
    var firstNumberPlaceHolder = 0 {
        didSet {
            numberInString = String(combineDigits(firstNumberPlaceHolder))
        }
    }
    // 연산자를 입력받은 후 새로운 숫자를 받기 전에 기존값이 저장되는 장소
    var previousValue = 0
    // 연산자가 지속적으로 들어올 때 임시 값이 저장되는 장소
    var temporaryResult = 0
    var operatorPlaceHolder = ""
    // 어떤 버튼을 눌러 들어왔는지를 확인하는 변수
    var buttonOperator = ""
    
    // firstNumberPlaceHolder 에서 값을 입력받고 레이블에 표시될 정보의 변수에 할당한다.
    var numberInString = "" {
        didSet {
            if numberInString == "" {
                currentlyDisplayingNumber = "0"
            }
            else {
                currentlyDisplayingNumber = numberInString
            }
        }
    }
    
    var currentNumberInString = ""
    
    // 최종적으로 표시될 데이터를 currentlyDisplayingNumber 에 전달한다
    var resultInString = "" {
        didSet {
            currentlyDisplayingNumber = resultInString
        }
    }
    
    mutating func combineDigits(_ num: Int) -> Int {
        if operatorPlaceHolder == "=" {
            numberInString = ""
            operatorPlaceHolder = ""
        }
        numberInString += String(firstNumberPlaceHolder)
        guard let value = Int(numberInString) else {
            return 0
        }
        return value
    }
    
    // +, -, ×, ÷ 에 대한 함수
    mutating func saveValue() {
        print("This is operatorPlaceHoler in saveValue: ", operatorPlaceHolder)
        // 이어서 연산되고 있는 값이 있다면...
        if operatorPlaceHolder != "" && operatorPlaceHolder != "=" {
            print("button pressed with operator")
            
            // operatorPlaceHolder 는 saveValue 가 실행된 뒤에 할당 되기 때문에 buttonOperator 로 최신 정보를 할당받는다.
//            operatorPlaceHolder = buttonOperator
            
            guard let value = Int(numberInString) else {
                print("saveValue Guard activated")
                temporaryResult = 0
                return
            }
            // 이전에 previousValue 로 저장된 값을 temporaryResult 에 할당한다.
            temporaryResult += previousValue
            print(temporaryResult)
            previousValue = value
                        
            switch operatorPlaceHolder {
            case "+":
                temporaryResult += previousValue
                print("temp", temporaryResult)
            case "-":
                temporaryResult -= previousValue
                print("temp", temporaryResult)
            case "×":
                temporaryResult *= previousValue
                print("temp", temporaryResult)
            case "÷":
                temporaryResult /= previousValue
                print("temp", temporaryResult)
            default:
                print("what the hell")
                return
            }
            // temporaryResult 를 사용하게 될 경우 previousValue 가 중복되어 연산되지 않도록 초기화
            previousValue = 0
            numberInString = ""
            resultInString = String(temporaryResult)
        }
        // 이전에 입력된 연산자가 없다면...
        else {
            operatorPlaceHolder = buttonOperator
            print("saveValue Else option")
            guard let value = Int(numberInString) else {
                return
            }
            // 기존 입력받은 값을 저장
            previousValue = value
            print(previousValue)
            currentNumberInString = numberInString
            // 새로운 값을 입력받기 위한 값 초기화
            numberInString = ""
            resultInString = String(previousValue)
        }
    }
    
    // = 에 대한 함수
    mutating func calculate() {
        print("calculate \(operatorPlaceHolder)")
        switch operatorPlaceHolder {
        case "+":
            guard let currentValue = Int(currentNumberInString) else {
                print("calculate guard")
                return
            }
            resultInString = String(temporaryResult + previousValue + currentValue)
            // 다시 한번 연산이 입력될 경우를 대비
            numberInString = resultInString
            print("\(temporaryResult) + \(previousValue) + \(currentValue)")
            // operator 저장 초기화
            operatorPlaceHolder = ""
            // 연속 연산을 위한 임시저장소 초기화
            temporaryResult = 0
        case "-":
            guard let currentValue = Int(currentNumberInString) else {
                return
            }
            resultInString = String(temporaryResult + previousValue - currentValue)
            numberInString = resultInString
            operatorPlaceHolder = ""
            temporaryResult = 0
        case "×":
            guard let currentValue = Int(currentNumberInString) else {
                return
            }
            resultInString = String(temporaryResult + previousValue * currentValue)
            numberInString = resultInString
            operatorPlaceHolder = ""
            temporaryResult = 0
        case "÷":
            guard let currentValue = Int(currentNumberInString) else {
                return
            }
            resultInString = String(temporaryResult + previousValue / currentValue)
            numberInString = resultInString
            operatorPlaceHolder = ""
            temporaryResult = 0
        default:
            print("stop pressing '='")
        }
    }
}
