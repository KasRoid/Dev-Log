//: [Previous](@previous)
import Foundation

/*:
 ---
 ## Practice
 ---
 */

/*
 [ 1번 문제 ]
 let numbers = [-2, -1, 0, 1, 2]
 numbers.compactMap {
   $0 >= 0 ? $0 : nil
 }
 => [0, 1, 2]
 
 위와 같이 compactMap을 이용했을 때와 동일한 결과가 나오도록 compactMap 없이 구현
 */

print("\n---------- [ 1번 문제 ] ----------\n")

let numbers = [-2, -1, 0, 1, 2]
print(numbers.filter{ $0 >= 0 })




/*
 [ 2번 문제 ]
 
 let nestedArr = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
 nestedArr.flatMap { $0 }
 => [1, 2, 3, 9, 8, 7, -1, 0, 1]
 
 위와 같이 flatMap을 이용했을 때와 동일한 결과가 나오도록 flatMap 없이 구현
 */

print("\n---------- [ 2번 문제 ] ----------\n")

let nestedArr = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
func anotherFlatMap(array: [[Int]]) -> [Int] {
    var result: Array<Int> = []
    for subArray in array {
        for number in subArray {
            result.append(number)
        }
    }
    return result
}
print(
    anotherFlatMap(array: nestedArr)
)


/*
 [ 3번 문제 ]
 Q. map 과 flatMap, compactMap 을 이용하여 다음 3가지 결과값이 나오도록 출력해보기
 
 1. [[1, 2, 3], [5], [6], []]
 2. [Optional(1), Optional(2), Optional(3), nil, Optional(5), Optional(6), nil, nil] 
 3. [1, 2, 3, 5, 6]
 */

print("\n---------- [ 3번 문제 ] ----------\n")

let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]
let firstArray = array.map { $0.compactMap { $0 } }
let secondArray = array.flatMap { $0 }
let thirdArray = array.flatMap { $0 }.compactMap { $0 }
print(firstArray)
print(secondArray)
print(thirdArray)


/*
 [4번 문제 ]
 Q. 아래 배열에서 숫자에 해당하는 문자열만 골라낸 뒤, 그 숫자들을 제곱한 결과를 모두 더한 값 출력
 고차함수만을 이용할 것
 
 ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
 */

print("\n---------- [ 4번 문제 ] ----------\n")

let mixedString = ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
print(mixedString.compactMap { Int($0) }.map { $0 * $0 }.reduce(0) {$0 + $1})


//: [Next](@next)
