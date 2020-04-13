import UIKit

/*
[ Assignment ]
- 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
  (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
- 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
- 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
*/

// Assignment #01
func connectInteger(_ num1: Int, _ num2: Int) -> Int {
    let num1Str = String(num1)
    let num2Str = String(num2)
    let connectString = num1Str + num2Str // 정수를 문자로 변환하여 연결
    let convertToInt = Int(connectString) // 문자를 다시 정수로 변환, 현재 옵셔널 상태
    
    if let result = convertToInt { // optional binding
        return result
    }
    return 0
}

print(connectInteger(6, 50))


// Assignment #02
func compareString(String1: String, String2: String) -> String {
    func areSame() -> Bool {
        if String1 == String2 {
            return true
        }
        else {
            return false
        }
    }
    
    if areSame() == true {
        return "Two strings are same."
    }
    else {
        return "Two strings are NOT same."
    }
}

print(compareString(String1: "A", String2: "A"))


// Assignment #03
func divisor(_ Integer: Int) {
    var arrOfDivisor: Array<Int> = []
    
    for i in 1...Integer {
        if Integer % i == 0 {
            arrOfDivisor.append(i)
        }
    }
    for i in 0...arrOfDivisor.count - 1 {
        print(arrOfDivisor[i], terminator: " ")
    }
    print("")
}

divisor(15)

// Assignment #04
func commonMultiple(_ Integer: Int) {
    for i in 1...Integer {
        if 15 * i <= Integer {
            print(15 * i, terminator: " ")
        }
    }
}

commonMultiple(89)
