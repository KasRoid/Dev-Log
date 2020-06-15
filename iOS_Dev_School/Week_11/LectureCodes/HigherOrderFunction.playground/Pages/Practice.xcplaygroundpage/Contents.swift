//: [Previous](@previous)
import Foundation

// 키노트 문제 참고
/*:
 ---
 ## Practice 1
 ---
 */
print("\n---------- [ Practice 1 ] ----------\n")

struct Pet {
    enum PetType {
        case dog, cat, snake, pig, bird
    }
    var type: PetType
    var age: Int
}

let myPet = [
    Pet(type: .dog, age: 13),
    Pet(type: .dog, age: 2),
    Pet(type: .dog, age: 7),
    Pet(type: .cat, age: 9),
    Pet(type: .snake, age: 4),
    Pet(type: .pig, age: 5),
]

// 1번
func sumDogAge(pets: [Pet]) -> Int {
    let dogs = pets.filter() { $0.type == .dog }
    let totalAge = dogs.reduce(0) { $0 + $1.age }
    return totalAge
}
sumDogAge(pets: myPet)

// 2번
func oneYearOlder(of pets: [Pet]) -> [Pet] {
    let result = pets.map() { Pet(type: $0.type, age: $0.age + 1) }
    return result
}
oneYearOlder(of: myPet)



/*:
 ---
 ## Practice 2
 ---
 */
print("\n---------- [ Practice 2 ] ----------\n")

//[ 문제 ] 
//immutableArray 배열의 각 인덱스와 해당 인덱스의 요소를 곱한 값 중 홀수는 제외하고 짝수에 대해서만 모든 값을 더하여 결과 출력
//단, 아래 1 ~ 3번에 해당하는 함수를 각각 정의하고 이것들을 함께 조합하여 위 문제의 결과를 도출할 것 1. 배열의 각 요소 * index 값을 반환하는 함수
//2. 짝수 여부를 판별하는 함수
//3. 두 개의 숫자를 더하여 반환하는 함수

let immutableArray = Array(1...40)

private func multiplyByIndex(index: Int, array: [Int]) -> Int {
    return index * array[index]
}

private func isEven(_ number: Int) -> Bool {
    return number % 2 == 0
}

private func addTwoNumbers(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

let result = immutableArray
    .map { multiplyByIndex(index: $0 - 1, array: immutableArray) }
    .filter(isEven(_:))
    .reduce(0) { addTwoNumbers(num1: $0, num2: $1) }
print(result)
//: [Next](@next)
