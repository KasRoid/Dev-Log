import UIKit

/*
[ Challenge ]
- 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
- 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
  참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
  e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
  함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력
- 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
  (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
  ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
      윤년X 예시 - 200, 300, 500, 600, 1900, 2100
*/

// Challenge #01
func primeNumber (_ num1: Int) {
    var arrOfNumbers: Array<Int> = []
    
    for i in 1...num1 {
        if num1 % i == 0 {
            arrOfNumbers.append(i)
        }
    }
    
    if arrOfNumbers.count <= 2 {
        print("\(num1) is a prime number!")
    }
    else {
        print("\(num1) is NOT a prime number.")
    }
}

primeNumber(13)


// Challenge #02
func checkFibonacci (_ num1: Int) {
    var arrOfFibonacci: Array<Int> = [0, 1]
    var i = 0
    var j = 1
    
    while arrOfFibonacci.count < num1 {
        arrOfFibonacci.append(arrOfFibonacci[i] + arrOfFibonacci[j])
        i += 1
        j += 1
    }
    
    print(arrOfFibonacci[arrOfFibonacci.endIndex - 1])
}

checkFibonacci(8)


// Challenge #03
func leapYear (year: Int) {
    if year % 400 == 0 {
        print("\(year) is a leap yaer!")
    }
    else if year % 4 == 0 && year % 100 != 0 {
        print("\(year) is a leap yaer!")
    }
    else {
        print("\(year) is NOT a leap yaer!")
    }
}

leapYear(year: 400)
