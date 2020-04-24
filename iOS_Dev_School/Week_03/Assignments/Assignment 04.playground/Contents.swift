import UIKit

/*
[ 과제 - 알고리즘 ]
1. 입력받은 숫자의 모든 자리 숫자 합계를 출력하기
e.g.  123 -> 6 ,  5678 -> 26
*/


func sumOfDigits (num: Int) -> Int {
    var input = num
    var arrInput: Array<Int> = []
    var result: Int = 0
    
    while input > 0 {
        arrInput.append(input % 10)
        input /= 10
    }
    for i in arrInput {
        result += i
    }
    return result
}

sumOfDigits(num: 123)



/*
2. 하샤드 수 구하기
- 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수
e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수.
*/

func harshadNum (num: Int) -> Bool {
    var input = num
    var arrInput: Array<Int> = []
    var sumOfInput: Int = 0
    var result: Bool
    
    while input > 0 {
        arrInput.append(input % 10)
        input /= 10
    }
    
    for i in arrInput {
        sumOfInput += i
    }
    
    result = num % sumOfInput == 0 ? true : false
    return result
}

harshadNum(num: 18)
