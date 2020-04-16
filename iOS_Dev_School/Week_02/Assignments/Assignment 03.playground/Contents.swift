import UIKit

/*
[ 과제 ]
1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

func combineString(str1: String?, str2: String?, str3: String?) -> String {
  // code
}

// 입력 예시 및 결과
combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"
*/

var result: String = "" // 결과를 담을 string 변수

func connectString(str1: String?, str2: String?, str3: String?) -> String {
    let a = str1 ?? "" // nil 병합 연산자를 사용하여 optional unwrapping
    let b = str2 ?? ""
    let c = str3 ?? ""
    
    result = a + b + c
    return result
}

print(connectString(str1: "AB", str2: nil, str3: "CD"))


// 아래는 한번에 바인딩 하려다 실패한 코드, 셋 중 하나라도 nil 값이 있으면 바인딩이 진행되지 않는다.
/*
    if let a = str1, let b = str2, let c = str3 {
        result = a + b + c
        print(a)
    }
 */


/*
2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
enum Arithmetic {
  case addition, subtraction, multiplication, division
}
*/

enum Arithmetic {
    case addition, subtraction, multiplication, division
    
    func calculate(num1: Int, num2: Int) -> Int {
        switch self {
        case .addition:
            return num1 + num2
        case .subtraction:
            return num1 - num2
        case .multiplication:
            return num1 * num2
        case .division:
            return num1 / num2
        }
    }
}

print(Arithmetic.addition.calculate(num1: 6, num2: 3)) // 9
print(Arithmetic.subtraction.calculate(num1: 6, num2: 3)) // 3
print(Arithmetic.multiplication.calculate(num1: 6, num2: 3)) // 18
print(Arithmetic.division.calculate(num1: 6, num2: 3)) // 2

let add = Arithmetic.addition // 변수에 미리 사용할 케이스를 저장해 놓을 수도 있다.
add.calculate(num1: 5, num2: 5)
