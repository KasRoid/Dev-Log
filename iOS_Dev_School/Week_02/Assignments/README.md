## Assignments for Week 02 ##

### Date: 2020.04.10 ###

#### Assignment 01 ####
1. 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수 
  (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
   ``` Swift
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
   ```

2. 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
   ```Swift
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
   ```

3. 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
   ```Swift
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
   ```

4. 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
   ```Swift
   func commonMultiple(_ Integer: Int) {
       for i in 1...Integer {
           if 15 * i <= Integer {
               print(15 * i, terminator: " ")
           }
       }
   }

   commonMultiple(89)
   ```


#### Challenge 01 ####
1. 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
   ```Swift
   unc primeNumber (_ num1: Int) {
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
   ```

2. 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
  참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
  e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
  함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력
   ```Swift
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
   ```

3. 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
  (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
  ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
      윤년X 예시 - 200, 300, 500, 600, 1900, 2100
   ```Swift
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
   ```