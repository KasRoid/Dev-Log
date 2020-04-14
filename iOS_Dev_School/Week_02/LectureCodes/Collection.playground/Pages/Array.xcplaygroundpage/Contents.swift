//: [Previous](@previous)
import Foundation
/*:
 ---
 ## Array
 - Ordered Collection
 - Zero-based Integer Index
 ---
 */

/*:
 ### Mutable, Immutable
 */

var variableArray = [1, 2]
variableArray = []


let constantArray = [1, 2]
//constantArray = []


/*:
 ### Array Type
 */

var arrayFromLiteral = [1, 2, 3]
arrayFromLiteral = []
type(of: arrayFromLiteral)

//let emptyArray = []

//let emptyArray: [String] = []


/*:
 ### Initialize
 */

// Type Annotation
let strArray1: Array<String> = ["apple", "orange", "melon"]
let strArray2: [String] = ["apple", "orange", "melon"]

// Type Inference
let strArray3 = ["apple", "orange", "melon"]
let strArray4 = Array<String>(repeating: "iOS", count: 5)

// Error
//let strArray5 = ["apple", 3.14, 1]


/*:
 ---
 ### Question
 - String, Int 타입으로 각각 자료가 없는 빈 배열을 만들어 보세요.
 - Double, Bool 타입으로 임의의 값을 넣어 초기화하는 배열을 만들어 보세요.
 ---
 */
// 직접 작성한 코드
let emptyArr: Array<String> = []
let emptyArrInt: Array<Int> = []

let doubleArr: Array<Double> = [0.0, 1.1, 2.2, 3.3]
let boolArr: Array<Bool> = [true, false, true]
/*:
 ### Number of Elements
 */
print("\n---------- [ Number of Elements ] ----------\n")

let fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count
countOfFruits


if !fruits.isEmpty {
  print("\(countOfFruits) element(s)")
} else {
  print("empty array")
}


/*:
 ### Retrieve an Element
 */
//              0        1         2          3
// fruits = ["Apple", "Orange", "Banana", endIndex]

fruits[0]
fruits[2]
//fruits[123]

fruits.startIndex
fruits.endIndex
type(of: fruits.endIndex)

fruits[fruits.startIndex]
//fruits[fruits.endIndex]
fruits[fruits.endIndex - 1]

fruits.startIndex == 0
fruits.endIndex - 1 == 2


/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")

let alphabet = ["A", "B", "C", "D", "E"]

if alphabet.contains("A") {
  print("contains A")
}

if alphabet.contains(where: { str -> Bool in
  // code...
  return str == "A"
}) {
  print("contains A")
}

if let index = alphabet.firstIndex(of: "Q") {
  print("index of Q: \(index)")
} else {
  print("No index")
}

//let idx1 = alphabet.firstIndex(of: "D")
//print(idx1)
//
//let idx2 = alphabet.firstIndex(of: "Q")
//print(idx2)


/*:
 ### Add a new Element
 */

//var alphabetArray: Array<String> = []
//var alphabetArray: [String] = []
//var alphabetArray = [String]()

var alphabetArray = ["A"]
alphabetArray.append("B")
alphabetArray += ["C"]
alphabetArray

var alphabetArray2 = ["Q", "W", "E"]
alphabetArray + alphabetArray2

//alphabetArray.append(5.0)
//alphabetArray + 1

alphabetArray.insert("S", at: 0)
alphabetArray.insert("F", at: 3)
alphabetArray

/*:
 ### Change an Existing Element
 */

alphabetArray = ["A", "B", "C"]
alphabetArray[0] = "Z"
alphabetArray


1...5
1..<5
1...

alphabetArray = ["A", "B", "C", "D", "E", "F"]
alphabetArray[2...]
alphabetArray[2...] = ["Q", "W", "E"]
alphabetArray



/*:
 ### Remove an Element
 */
alphabetArray = ["A", "B", "C", "D", "E"]

let removed = alphabetArray.remove(at: 0) // 제거된 값이 removed 에 담김
alphabetArray

alphabetArray.removeAll()


// index 찾아 지우기
alphabetArray = ["A", "B", "C", "D", "E"]

if let indexC = alphabetArray.firstIndex(of: "C") {
  alphabetArray.remove(at: indexC)
}
alphabetArray


/*:
 ### Sorting
 */

alphabetArray = ["A", "B", "C", "D", "E"]
alphabetArray.shuffle()

alphabetArray.sort()
alphabetArray

// shuffle vs shuffled
// sorted vs sort

//func sorted() -> [Element]
//mutating func sort()

alphabetArray.shuffle()

var sortedArray = alphabetArray.sorted()
sortedArray
alphabetArray


// sort by closure syntax

sortedArray = alphabetArray.sorted { $0 > $1 }
alphabetArray.sorted(by: >= )
sortedArray


/*:
 ### Enumerating an Array
 */
print("\n---------- [ Enumerating an Array ] ----------\n")

// 배열의 인덱스와 내용을 함께 알고 싶을 때

let array = ["Apple", "Orange", "Melon"]

for value in array {
  if let index = array.firstIndex(of: value) {
    print("\(index) - \(value)")
  }
}

for tuple in array.enumerated() {
  print("\(tuple.0) - \(tuple.1)")
//  print("\(tuple.offset) - \(tuple.element)")
}

for (index, element) in array.enumerated() {
  print("\(index) - \(element)")
}


for (index, element) in array.reversed().enumerated() {
  print("\(index) - \(element)")
}


/*:
 ---
 ### Question
 ---
 */
/*
 1. ["p", "u", "p", "p", "y"] 라는 값을 가진 배열에서 마지막 "p" 문자 하나만 삭제하기
 2. 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
 3. 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수
 */

// 2번 문제 예
// ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]

// 3번 문제 예
// ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59


// 직접 작성한 코드
var alphabetArr: Array<String> = ["p", "u", "p", "p", "y"]

if let indexP = alphabetArr.firstIndex(of: "p") {
    alphabetArr.remove(at: indexP)
}
alphabetArr


let intArr1 = [1, 2, 4, 8, 9, 12, 13]
let intArr2 = [2, 5, 6, 9, 13]
var commonArr: Array<Int> = []

for i in intArr1 {
    for j in intArr2 {
        if i == j {
            commonArr.append(i)
        }
    }
}
commonArr


var intArr = [50, 23, 29, 1, 45, 39, 59, 19, 15]
intArr.sort()
intArr.last

/*:
 ---
 ### Answer
 ---
 */

print("\n---------- [ Answer ] ----------\n")

/*
 ["p", "u", "p", "p", "y"] 라는 배열에서 마지막 "p" 문자 하나만 삭제하기
 */

var puppy = ["p", "u", "p", "p", "y"]
if let lastIndexOfP = puppy.lastIndex(of: "p") {
  puppy.remove(at: lastIndexOfP)
}
puppy


/*
 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
 ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]
 */

let firstArray = [1, 2, 4, 8, 9, 12, 13]
let secondArray = [2, 5, 6, 9, 13]

var result: [Int] = []
for i in firstArray {
  for j in secondArray {
    if i == j {
      result.append(j)
    }
  }
}

result



/*
 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수 만들기
 ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59
 */

// 1) Swift 에서 제공하는 기본 함수인 max() 를 이용하는 방법
let arr = [50, 23, 29, 1, 45, 39, 59, 19, 15]
arr.max()


// 2) 두 수 중 높은 값을 반환하는 max 를 이용하거나, 3항 연산자를 이용하는 방법
func maximumValue(in list: [Int]) -> Int {
  var maxValue = Int.min
  for number in list {
    maxValue = max(maxValue, number)
    
    // 위 함수는 다음의 3항 연산자와 동일
//     maxValue = maxValue < number ? number : maxValue
  }
  return maxValue
}

maximumValue(in: [50, 23, 29, 1, 45, 39, 59, 19, 15])
maximumValue(in: [10, 20, 30, 80, 50, 40])
maximumValue(in: [-6, -5, -4, -3, -2, -1])



//: [Next](@next)
