//: [Previous](@previous)

/*
 "Hello, World!" 문자열을 출력하기 위한 코드 작성
 */

print("Hello, Wolrd")


/*
 2개의 정수를 입력 받아서 그 숫자들을 더한 뒤 결과를 정수로 반환하는 함수 작성
 */

func addTwoNums (num1: Int, num2: Int) -> Int {
    return num1 + num2
}

/*
 2개의 정수를 입력 받아 그 숫자들을 곱한 뒤 결과값을 문자열로 반환하는 함수 작성
 */

func multiplyTwoNums (num1: Int, num2: Int) -> String {
    return String(num1 * num2)
}



/*
 주어진 숫자가 짝수인지 홀수인지 판단하는 함수 작성 (switch 문으로 해결)
 */

func evenOrOdd (_ num: Int) {
    switch num % 2 {
    case 0:
        print("Even")
    default:
        print("Odd")
    }
}

evenOrOdd(2)
evenOrOdd(1)

/*
 Swift 3가지 다른 반복문 방식별로 각각 1부터 10까지 값을 더한 결과를 출력하는 코드 작성
 */
var result: Int = 0

for i in 1...10 {
    result += i
}
print(result)

/*-----------------------------*/

var anotherResult = 0
var defaultNum = 1

while defaultNum <= 10 {
    anotherResult += defaultNum
    defaultNum += 1
}
print(anotherResult)


/*
 Swift 에서 사용하는 네이밍 컨벤션의 종류를 나열하고 그것이 언제 사용되는지,
 그리고 그 특징에 대해 설명
 */

/*
 UpperCamelCase: Class, Struct, Enum, Protocol, Extension 등에 사용한다.
 lowerCamelCase: 변수, 상수, 함수 등 대부분의 경우에 사용한다.
 */




/*
 사전 지식 테스트 때 위 내용들을 제대로 푸신 분이 거의 없었는데
 지금은 대부분 많이 쉽죠?
 그만큼 많이 발전하셨습니다. :)
 */

//: [Next](@next)
