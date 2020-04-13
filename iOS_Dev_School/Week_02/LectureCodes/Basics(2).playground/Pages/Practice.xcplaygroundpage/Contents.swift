//: [Previous](@previous)
/*:
 # Practice
 */
/*:
 ---
 ## Conditional Statements
 ---
 */
/*
 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
 - 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
 - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수W
   (switch where clause 를 이용해 풀어볼 수 있으면 해보기)
 */

func grader (_ score: Double) -> String {
    switch score {
    case 4.5...:
        return("A+")
    case 4.0..<4.5:
        return("A")
    case 3.5..<4.0:
        return("B+")
    case 3.0..<3.5:
        return("B")
    case 2.5..<3.0:
        return("C+")
    case 2.0..<2.5:
        return("C")
    default:
        return("F")
    }
}

grader(1)

func monthInEnglish (_ month: Int) -> String {
    switch month {
    case 1:
        return("January")
    case 2:
        return("Feburary")
    case 3:
        return("March")
    case 4:
        return("April")
    case 5:
        return("May")
    case 6:
        return("June")
    case 7:
        return("July")
    case 8:
        return("August")
    case 9:
        return("September")
    case 10:
        return("October")
    case 11:
        return("November")
    case 12:
        return("December")
    default:
        return("Wrong Number")
    }
}

monthInEnglish(3)

func multiplication (_ num1: Int, _ num2: Int, _ num3: Int) -> Bool {
    let result = num1 * num2 * num3
    switch result {
    case 0...:
        return true
    default:
        return false
    }
}

multiplication(1, 1, 1)
/*:
 ---
 ## Loops
 ---
 */
/*
 반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
 - 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
   (Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
   ex) 5! = 5 x 4 x 3 x 2 x 1
 - 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
   (2, 5 를 입력한 경우 결과는 2의 5제곱)
 - 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
   (1234 인 경우 각 자리 숫자를 합치면 10)
 */

func factorialFunction (_ num1: Int) -> Int {
    var result = 1
    for i in 1...num1 {
        result *= i
    }
    return result
}

factorialFunction(4)

func powerFunction (Base: Int, Power: Int) -> Int {
    var result = 1
    for _ in 1...Power {
        result *= Base
    }
    return result
}

powerFunction(Base: 3, Power: 4)

func sumOfDigits (_ num1: Int) -> Int {
    var numberOfDigit = 0
    var input = num1
    var result = 0
    
    func digitCounter (_ num1: Int) -> Int {
        while input > 0 {
            input = input / 10
            numberOfDigit += 1
        }
    return numberOfDigit
    }
    digitCounter(num1)
    
    input = num1
    for _ in 1...numberOfDigit {
        result += input % 10
        input = input / 10
    }
    return result
}

sumOfDigits(95)
/*:
 ---
 ## Control Transfer
 ---
 */
/*
 - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
   그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
 - 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
 */

func sumOfIntegers(_ num1: Int) -> Int {
    var result = 0
    for i in 1...num1 {
        result += i
        if result > 2000 {
            return result
        }
    }
    return result
}

sumOfIntegers(65)

func sumInRange(_ num1: Int) -> Int {
    var result = 0
    
    switch num1 {
    case 1...30:
        for i in 1...19 {
        result += i
        }
    case 31...50:
        for i in 1...19 {
            result += i
        }
        for i in 31...num1 {
            result += i
        }
    default:
        print("Choose number between 1 ~ 50.")
    }
    return result
}

print(sumInRange(51))



//: [Next](@next)

