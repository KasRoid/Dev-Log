## Assignments for Week 02 Day 5 ##

### Date: 2020.04.17 ###

#### Challenge 04 ####

 1. 아래 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기
    ```Swift
    let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
    let isAscending: Bool
    if s1 > s2 {
        isAscending = true
    } else {
        isAscending = false
    }
    return isAscending
    }
    ```
    ```Swift
    let someClosure: (String, String) -> Bool = {
        let isAscending = $0 > $1
        return isAscending
    ```
2. 아래 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기
   ```Swift
   let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
     var count: Int = 0
     for _ in values {
       count += 1
     }
     return count
   }
   ```
   ```Swift
   // for 문을 꼭 쓰지 않아도 된다면 이렇게 까지 줄일 수 있다.
   let otherClosure: ([Int]) -> Int = {
       $0.count
   ```
   ```Swift
   // for 문을 사용해야한다면 이게 한계인듯?
   let otherClosure: ([Int]) -> Int = {
     var count = 0
     for _ in $0 {
       count += 1
     }
     return count
   }
   ```

## Assignments for Week 02 Day 4 ##

### Date: 2020.04.16 ###

#### Assignment 03 ####
1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

   입력 예시 및 결과
   - combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
   - combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"


   ```Swift
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
   ```

2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현

   enum Arithmetic {
     case addition, subtraction, multiplication, division
   }

   ```Swift
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
   ```

#### Challenge 02 ####

 1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
 각 케이스에는 Double 타입의 Associated Value 를 받도록 함

    추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
    섭씨 = (화씨 - 32) * 5 / 9
    섭씨 = 켈빈 + 273
     
    enum Temperature {
      // 코드
    }

      ```Swift
      enum Temperature {
          case celcius(Double), fahrenheit(Double), kelvin(Double)
          
          func toCelcius() -> Double {
              switch temp {
              case .fahrenheit(let x):
                  return (x - 32) * 5 / 9
              case .kelvin(let x):
                  return x + 273
              case .celcius(let x):
                  return x
              }
          }
      }

      var temp = Temperature.fahrenheit(80)
      temp = Temperature.kelvin(-250)

      temp.toCelcius()
      ```
      ```Swift
      // 추가적으로 풀어본 다른 방식
      enum Temperature: Double {
          case celcius, fahrenheit, kelvin

          func toCelcius(temp: Double) -> Double {
              switch self {
              case .fahrenheit:
                  return (temp - 32) * 5 / 9
              case .kelvin:
                  return temp + 273
              default:
                  return temp
              }
          }
      }

      var fahrenheitTemp = Temperature.fahrenheit
      var kelvinTemp = Temperature.kelvin

      fahrenheitTemp.toCelcius(temp: 80)
      kelvinTemp.toCelcius(temp: -250)

      ```


---

## Assignments for Week 02 Day 2 ##

### Date: 2020.04.14 ###

#### Assignment 02 ####
1. 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
   ex) 123 -> 321 , 10293 -> 39201
   ```Swift
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

   ```


2. 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
   ex) true - 123, 310, 369   /  false - 100, 222, 770

   ```Swift
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
   ```

#### Challenge 02 ####

1. 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
   ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]

   ```Swift
   let input = ["a", "b", "c", "a", "e", "d", "c"]

   var inputSet = Set(input) // set 에 넣어 중복된 값을 없에고 포함된 알파벳 리스트를 획득
   var result: Array<String> = [] // 결과를 넣기 위한 array
   var counter = 0 // 알파벳이 몇 번 나오는지 세기 위한 변수

   func noSameAlphabet (_ input: Array<String>) -> Array<String> {
       for i in inputSet { // 세트에 할당된 알파벳 리스트를 하나씩 순환
           counter = 0
           for j in 0...input.count - 1 { // input 배열의 데이터를 하나씩 순환
               if input[j] == i { // 세트 알파벳 리스트와 input 배열의 데이터가 같을 때마다 카운팅
                   counter += 1
               }
           }
           if counter == 1 { // 중복 알파벳이 없는 카운터가 1인 알파벳을 result 배열에 할당
               result.append(i)
           }
       }
       return result
   }

   print(noSameAlphabet(input).sorted())
   ```


2. 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고 + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기


   ![image](https://user-images.githubusercontent.com/41736472/79218651-b75b7680-7e8b-11ea-9615-2d5ef56369b9.png)


   ```Swift
   let animalType = [ // 이렇게 트리형식으로 작성해야 그나마 덜 헷갈리는 듯... 그래도 여전히 헷갈린다.
       "식육목": [
           "개과": ["개": ["자칼", "늑대", "북미산 이리" ],
                   "여우": ["아메리카 여우", "유럽 여우"]],
           "고양이과":["고양이": ["고양이", "살쾡이"],
                     "표범": ["사자", "호랑이"]]]]


   if let 식육목 = animalType["식육목"] // 정답
   {
       if let 고양이과 = 식육목["고양이과"]
       {
           if let 표범 = 고양이과["표범"]
           {
               print(표범[0], 표범[1])
           }
       }
   }

   // 그냥 추가적으로 한줄 코드표현 연습
   if let 식육목 = animalType["식육목"], let 고양이과 = 식육목["고양이과"], let 표범 = 고양이과["표범"], let result = 표범.first {
       print(result)
   }
   ```




--------------------------------------

## Assignments for Week 02  Day 1 ##

### Date: 2020.04.13 ###

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