import UIKit

/*
 [ Assignment 02 ]
 - 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
   ex) 123 -> 321 , 10293 -> 39201

 - 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
   ex) true - 123, 310, 369   /  false - 100, 222, 770
 */

let input = 321

func digitReversed (_ input: Int) -> Int {
    var holder = input // 홀더에 입력받은 숫자 할당: input 이 let 이므로
    var arrInput: Array<Int> = [] // 입력받은 숫자를 넣을 array
    var digitCounter = 0 // 입력받은 숫자가 몇 자리인지 세기 위한 카운터
    var result = 0 // 최종 결과물
    
    // 홀더에 입력된 숫자가 몇 자리인지 체크
    while holder > 0 {
        holder /= 10
        digitCounter += 1
    }
    
    // 위 과정에서 입력받은 숫자가 달라졌으므로 원래 input 값 재할당
    holder = input
    
    // 1의 자리 숫자부터 차례로 array 에 할당, 1의 자리 숫자부터 순서대로 할당된다.
    for _ in 1...digitCounter {
        arrInput.append(holder % 10)
        holder /= 10
    }
    
    var arrCounter = arrInput.count // array 에 할당된 데이터 갯수를 카운터로.. 그냥 위에서 이미 만든 digit 카운터 사용해도 되었을듯..
    var hundreds = 1 // 자릿수에 맞춰 100 을 곱해주기 위한 변수
    
    // 3자리 수이므로 hundreds 변수가 100 이 됨.
    while arrCounter > 1 {
        hundreds *= 10
        arrCounter -= 1
    }
    
    // 배열로 있던 데이터들을 자릿수에 맞춰 하나씩 빼내고 더하는 작업
    for i in 0...arrInput.count - 1 {
        result += arrInput[i] * hundreds
        hundreds /= 10
    }
    
   return result
}

print(digitReversed(input))




let number = 482

func noSameDigit (_ input: Int) -> Bool {
    guard input >= 100, input <= 900 else { // 100 ~ 900 사이 숫자가 아니면 함수 종료, 이렇게 하면 return 이 강제되어 결과에 false 가 표시되긴 하지만 그냥 guard 가 써보고싶었음...
        print("Please enter numbers only between 100 ~ 900")
        return false
    }
    
    var numHolder = number // number 가 let 이므로 변수에 다시 할당
    var numberSet: Set<Int> = [] // set 에 각 자릿수를 삽입하여 몇 개가 남는지 판단. 2개 이하면 동일한 숫자가 존재한다는 뜻이다.
    for _ in 1...3 { // set 에 각 자리를 삽입
        numberSet.insert(numHolder % 10)
        numHolder /= 10
    }
    
    switch numberSet.count { // set 에 몇개의 데이터가 있는지 확인
    case ..<3:
        return false
    default:
        return true
    }
}

print(noSameDigit(number))
