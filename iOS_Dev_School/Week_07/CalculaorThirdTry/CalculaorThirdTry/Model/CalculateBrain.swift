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
            print("Button Input: \(digitInputInString)")
            digitsIntoNumbers()
        }
    }
    private var userTypedNumber = "" // 현재 세션에서 타이핑되고 있는 숫자를 저장하는 변수
    private var storePreviousNumber = "" // 지난 세션에서 타이핑 된 숫자를 저장하는 변수
    var operatorInputInString = "" { // 방금 입력받은 연산자를 저장하는 변수
        didSet {
            prepareForCalculation()
        }
    }
    private var storeOperaterInputIntString = ""
    private var negativeValueCanBeTyped = true
    private var isNegative = false
    private var operaterInputCounter = 0 // 연산자가 지속적으로 입력될 경우 오류방지
    var displayOnScreen = "" // 최종적으로 디스플레이에서 처리하도록 전달할 내용
        
    private mutating func digitsIntoNumbers() {
        negativeValueCanBeTyped = false // 숫자가 먼저 입력된 경우 이후 음수처리가 될 수 없도록 설정
        if operatorInputInString != "" { // 연산명령을 받고 추가적으로 숫자가 입력될 경우
            prepareForCalculation()
        }
        userTypedNumber += digitInputInString
        displayOnScreen = userTypedNumber // 입력받은 숫자가 바로 레이블에 나타날 수 있도록 작업
    }
    
    private mutating func prepareForCalculation() {
        guard operatorInputInString != "=" else {
            print("'=' do NOT need to prepare for calculation")
            return
        }
        if negativeValueCanBeTyped && operatorInputInString == "-" {
            isNegative = true
            print("isNegative Activated")
        }
        storePreviousNumber = userTypedNumber // 현재까지 입력된 내용을 다른 변수에 저장
        userTypedNumber = "" // 숫자 입력장소 초기화
        storeOperaterInputIntString = operatorInputInString // 가장 최근 입력받은 연산 명령을 다른 변수에 저장
        operatorInputInString = "" // 연산자 입력장소 초기화
    }
    
    private mutating func calculate() {
        
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

// [userTypedNumber].forEach ({(_ input: String) in return input = ""})
