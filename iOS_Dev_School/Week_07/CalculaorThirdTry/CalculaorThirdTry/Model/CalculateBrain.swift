//
//  CalculateBrain.swift
//  CalculaorThirdTry
//
//  Created by Kas Song on 2020.05.20.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import Foundation

struct CalculateBrain {
    
    var digitInputInString = "" {
        didSet {
            if digitInputInString == "" {
                return
            }
            else {
                print("Button Input: \(digitInputInString)")
                operaterInputCounter = 0
                digitsIntoNumbers()
            }
        }
    }
    private var userTypedNumber = "" // 현재 세션에서 타이핑되고 있는 숫자를 저장하는 변수
    private var storePreviousNumber = "" // 지난 세션에서 타이핑 된 숫자를 저장하는 변수
    var operatorInputInString = "" { // 방금 입력받은 연산자를 저장하는 변수
        didSet {
            if operatorInputInString == "" {
                return
            }
            else if operatorInputInString != "=" {
                operaterInputCounter += 1
                prepareForCalculation()
            }
            else {
                operaterInputCounter = 0
                calculate()
            }
        }
    }
    private var storeOperaterInputIntString = ""
    private var negativeValueCanBeTyped = true
    private var isNegative = false
    private var operaterInputCounter = 0 // 연산자가 지속적으로 입력될 경우 오류방지
    var displayOnScreen = "" // 최종적으로 디스플레이에서 처리하도록 전달할 내용
        
    private mutating func digitsIntoNumbers() {
        negativeValueCanBeTyped = false // 숫자가 먼저 입력된 경우 이후 음수처리가 될 수 없도록 설정
        userTypedNumber += digitInputInString
        storePreviousNumber = userTypedNumber
        let placeHolder = userTypedNumber
        if operatorInputInString != "" && userTypedNumber != "-" { // 연산명령을 받고 추가적으로 숫자가 입력될 경우, 음수로 계산을 시작하는 경우는 제외할 수 있도록 조건 추가
            storePreviousNumber = userTypedNumber // 현재까지 입력된 내용을 다른 변수에 저장
//            userTypedNumber = "" // 숫자 입력장소 초기화
            storeOperaterInputIntString = operatorInputInString // 가장 최근 입력받은 연산 명령을 다른 변수에 저장
            operatorInputInString = "" // 연산자 입력장소 초기화
            print("digitsIntoNumbers func IF activated")
            print("This is previousNum", storePreviousNumber)
        }
        displayOnScreen = placeHolder // 입력받은 숫자가 바로 레이블에 나타날 수 있도록 작업
        print("StoredNumber in digitsIntoNumbers: \(storePreviousNumber)")
        print(userTypedNumber)
    }
    
    private mutating func prepareForCalculation() {
        print("Operator Counter before executing prepareForCalculation: \(operaterInputCounter)")
        guard operaterInputCounter < 2 else {
            print("Operator input detected repeatedly")
            return
        }
        if negativeValueCanBeTyped && operatorInputInString == "-" && userTypedNumber.isEmpty {
            isNegative = true
            operatorInputInString = "" // 연산자 저장 값 초기화
            print("isNegative Activated")
        }
        userTypedNumber = isNegative ? "-" + userTypedNumber : userTypedNumber // 음수일 경우 - 적용
        isNegative = false // 음수 처리이후 false 로 변경
        print("UserTypedNumber: ", userTypedNumber)
        
        if storePreviousNumber.isEmpty && storeOperaterInputIntString.isEmpty { // 3 + = 6
            storePreviousNumber = userTypedNumber
            storeOperaterInputIntString = operatorInputInString
            print("Empty Empty")
        }
        userTypedNumber = ""
        
    }
    
    private mutating func calculate() {
        print("storenum", storePreviousNumber, "userNum", userTypedNumber)
        guard let firstNumber = Double(storePreviousNumber), let secondNumber = Double(userTypedNumber) else {
            print("func calculate: Guard Activated")
            return
        }
        switch storeOperaterInputIntString {
        case "+":
            displayOnScreen = String(firstNumber + secondNumber)
        case "-":
            displayOnScreen = String(firstNumber - secondNumber)
        case "×":
            displayOnScreen = String(firstNumber * secondNumber)
        case "÷":
            displayOnScreen = String(firstNumber / secondNumber)
        default:
            print("func calculate: switch default")
            return
        }
        storePreviousNumber = displayOnScreen
        userTypedNumber = ""
        print("StoredNumber in calculate function: \(storePreviousNumber)")
        print("Operator counter: \(operaterInputCounter)")
    }
    
    mutating func resetButtonActivated() {
        digitInputInString = ""
        userTypedNumber = ""
        storePreviousNumber = ""
        operatorInputInString = ""
        storeOperaterInputIntString = ""
        negativeValueCanBeTyped = true
        isNegative = false
        operaterInputCounter = 0
        displayOnScreen = ""
    }
}
