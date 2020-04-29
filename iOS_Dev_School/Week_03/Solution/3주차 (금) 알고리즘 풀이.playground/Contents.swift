import UIKit

/*
 입력받은 숫자의 모든 자리 숫자 합계를 반환하기
 e.g. 123 -> 6 ,  5678 -> 26
 */
print("\n---------- [  ] ----------\n")

func sumAllDigits(_ num: Int) -> Int {
  var currentState = num
  var sum = 0

  while currentState != 0 {
    sum += currentState % 10
    currentState /= 10
  }
  return sum
}

sumAllDigits(123)
sumAllDigits(5678)



/*
 어떤 자연수를 입력했을 때 그 수가 하샤드 수인지 아닌지 여부를 반환하기
 - 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수 (10, 12, 18, 20, 21, 24 등이 해당됨)
 e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수
 */

func isHarshadNumber(num: Int) -> Bool {
  guard num > 0 else { return false }
  let sumDigits = sumAllDigits(num)
  return num % sumDigits == 0
}

// 하샤드 수 O
isHarshadNumber(num: 10)
isHarshadNumber(num: 12)
isHarshadNumber(num: 18)

// 하샤드 수 X
isHarshadNumber(num: 15)
isHarshadNumber(num: 22)
