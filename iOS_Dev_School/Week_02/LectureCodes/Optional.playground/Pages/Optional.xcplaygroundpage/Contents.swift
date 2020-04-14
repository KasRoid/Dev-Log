//: [Previous](@previous)
/*:
 ---
 ## Optional Type Declaration
 ---
 */
/*
 var <#variable name#>: <#Type?#>
 var <#variable name#>: <#Optional<Type>#>
 */

var optionalType1: String?   // 자동 초기화 nil
var optionalType2: Optional<Int> = nil   // 수동 초기화. (값 또는 nil)

optionalType1
type(of: optionalType1)
type(of: optionalType2)


// Valueless state - nil

var optionalIntInit = Optional<Int>(0)
var optionalInt: Int? = 0
type(of: optionalInt)

optionalInt = nil
optionalInt


// Optional -> NonOptional

//var nonOptional1 = nil
//var nonOptional2: Int = nil
//var nonOptionalType: Int = optionalInt



// Optional <- NonOptional

let nonOptional = 1
optionalInt = nonOptional
optionalInt = 100


// Optional -> NonOptional (X)
// Optional <- NonOptional (O)

// 각 타입이 가질 수 있는 값의 범위
// var nonOptionalNumber: Int    // 정수
// var optionalNumber: Int?      // 정수 or nil



/*:
 ---
 ## Optional Biding and Forced Unwrapping
 ---
 */
var convertedNumber: Int? = 123

if convertedNumber != nil {
  // warning + Optional(123)
  print("convertedNumber has an integer value of \(convertedNumber).")
}

/*:
 ---
 ### Optional Binding
 ---
 */
print("\n---------- [ Optional Binding ] ----------\n")
/*
 if let <#nonOptional#> = <#OptionalExpression#> {
   <#Code#>
 }
 while let <#nonOptional#> = <#OptionalExpression#> {
   <#Code#>
 }
 guard let <#nonOptional#> = <#OptionalExpression#> else {
   <#Code#>
 }
 */


let someValue = "100"

if let number = Int(someValue) {
  print("\"\(someValue)\" has an integer value of \(number)")
} else {
  print("Could not be converted to an integer")
}



// Optional Binding

var optionalStr: String? = "Hello, Optional"
print(optionalStr)

if let optionalStr = optionalStr {
  print(optionalStr)
} else {
  print("valueless string")
}



// 여러 개의 옵셔널 바인딩과 불리언 조건을 함께 사용 가능
if let firstNumber = Int("4"),
  let secondNumber = Int("42"),
  firstNumber < secondNumber,
  secondNumber < 100 {
  print("\(firstNumber) < \(secondNumber) < 100")
}

// 위와 동일한 동작
if let firstNumber = Int("4") {
  if let secondNumber = Int("42") {
    if firstNumber < secondNumber, secondNumber < 100 {
      print("\(firstNumber) < \(secondNumber) < 100")
    }
  }
}


/*:
 ---
 ### Forced Unwrapping
 ---
 */
/*
 let nonOptional = <#OptionalExpression!#>
 */

print("\n---------- [ Forced Unwrapping ] ----------\n")

if convertedNumber != nil {
//  print("convertedNumber has an integer value of \(convertedNumber).")
  print("convertedNumber has an integer value of \(convertedNumber!).")
}

print(convertedNumber)
print(convertedNumber!)


// Forced unwrap of nil value

convertedNumber = nil
convertedNumber
//convertedNumber!


/*:
 ## IUO (Implicitly Unwrapped Optionals)
 */

// Optional
let possibleString: String? = "An optional string."
//let forcedString: String = possibleString  // Error
let forcedString: String = possibleString!
type(of: possibleString)
type(of: forcedString)


// Implicitly Unwrapped Optional
// Non Optional 타입인 것처럼 함께 사용 가능
var assumedString: String! = "An implicitly unwrapped optional string."
let stillOptionalString = assumedString
type(of: assumedString)
type(of: stillOptionalString)
print(assumedString)
print(assumedString!)

let implicitString: String = assumedString
type(of: implicitString)

//assumedString = nil
//print(assumedString!)


/*
 - 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
 - nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용
 - 프로퍼티 지연 초기화에 많이 사용
 */


/*:
 ## Nil-coalescing Operator
 */

print("\n---------- [ Nil-coalescing ] ----------\n")

optionalStr = nil

var result = ""
if optionalStr != nil {
   result = optionalStr!
} else {
   result = "This is a nil value"
}
print(optionalStr)
print(result)


let anotherExpression = optionalStr ?? "This is a nil value"
print(optionalStr)
print(anotherExpression)


let optionalInteger: Int? = 100
let anotherExpression2 = optionalInteger ?? -1
print(anotherExpression2)


// 어디에 쓰일 수 있을까요?
// Example

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

/*:
 ---
 ### Question
 - isTrue ? a : b   와의 차이
 - optionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
 ---
 */


/*:
 ## Optional Chaining
 */

print("\n---------- [ Optional Chaining ] ----------\n")

let greeting: [String: String] = [
  "John": "Wassup",
  "Jane": "Morning",
  "Edward": "Yo",
  "Tom": "Howdy",
  "James": "Sup"
]

print(greeting["John"])
print(greeting["John"]?.count)
print(greeting["NoName"])

// Optional Chaining
print(greeting["John"]?.lowercased().uppercased())
print(greeting["Alice"]?.lowercased().uppercased())

// Optional Binding
if let greetingValue = greeting["John"] {
  print(greetingValue.lowercased().uppercased())
}

/*:
 ---
 ### Question
 - 아래 두 종류 옵셔널의 차이점이 무엇일까요?
 ---
 */

print("\n---------- [ ] ----------\n")

var optionalArr1: [Int]? = [1,2,3]
var optionalArr2: [Int?] = [1,2,3]


var arr1: [Int]? = [1,2,3]
//arr1.append(nil)
//arr1 = nil

//print(arr1?.count)
//print(arr1?[1])


var arr2: [Int?] = [1,2,3]
//arr2.append(nil)
//arr2 = nil

//print(arr2.count)
//print(arr2[1])
//print(arr2.last)


/*:
 ---
 ## Optional Function Types
 ---
 */
print("\n---------- [ Optional Function ] ----------\n")

func voidFunction() {
  print("voidFunction is called")
}

//var functionVariable: () -> () = voidFunction
var functionVariable: (() -> ())? = voidFunction
functionVariable?()

functionVariable = nil
functionVariable?()



func sum(a: Int, b: Int) -> Int {
  a + b
}
sum(a: 2, b: 3)

//var sumFunction: (Int, Int) -> Int = sum(a:b:)
var sumFunction: ((Int, Int) -> Int)? = sum(a:b:)
type(of: sumFunction)

//print(sumFunction?(1, 2))
//print(sumFunction!(1, 2))

//sumFunction = nil
//sumFunction?(1, 2)
//sumFunction!(1, 2)




/*:
 ---
 ### Question
 - 아래 내용 참고하여 함수 정의
 ---
 */
/*
 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수를 만들되
 2번째 파라미터와 결과값의 타입은 옵셔널로 정의.
 두 번째 파라미터 입력값으로 nil 이나 0이 들어오면 결과로 nil을 반환하고, 그 외에는 계산 결과 반환
 
 func calculateModulo(op1: Int, op2: Int?) -> Int? {
 }
 */



/*:
 ---
 ### Answer
 ---
 */
// OptionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
let answer = optionalStr != nil ? optionalStr! : "This is a nil value"




// 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수
func calculateModulo(op1: Int, op2: Int?) -> Int? {
  guard let op2 = op2, op2 != 0 else { return nil }
  return op1 % op2
}

calculateModulo(op1: 10, op2: 4)
calculateModulo(op1: 39, op2: 5)




//: [Next](@next)
