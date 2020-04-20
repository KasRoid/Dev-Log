import UIKit

/*
1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
   구현 내용은 자유롭게
 
 ** 강아지 (Dog)
 - 속성: 이름, 나이, 몸무게, 견종
 - 행위: 짖기, 먹기
 
 ** 학생 (Student)
 - 속성: 이름, 나이, 학교명, 학년
 - 행위: 공부하기, 먹기, 잠자기
 
 ** 아이폰(IPhone)
 - 속성: 기기명, 가격, faceID 기능 여부(Bool)
 - 행위: 전화 걸기, 문자 전송

 ** 커피(Coffee)
 - 속성: 이름, 가격, 원두 원산지
*/
 
class Dog {
    var name: String
    var age = 0
    var weight = 1
    var type = "Puddle"
    
    init(name: String) {
        self.name = name
    }
    
    func bark() {
        print("Bark!! Bark!!")
    }
    func eat() {
        print("Meats! Cookies!")
    }
}

class Student {
    var name: String
    var age: Int
    var school: String = "Elementary School"
    var year: Int = 1
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func study() {
        print("I'm studying")
    }
    func eat() {
        print("I'm eating")
    }
    func sleep() {
        print("Zzzzzz")
    }
}
 
class Iphone {
    var name: String
    var price: Int
    var faceid: Bool
    
    init(name: String, price: Int, faceid: Bool) {
        self.name = name
        self.price = price
        self.faceid = faceid
    }
}

class coffee {
    var name: String = "Americano"
    var price: Int = 2000
    var origin: String
    
    init(origin: String) {
        self.origin = origin
    }
}
 
/*
2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
 
 ** 계산기 (Calculator)
 - 속성: 현재 값
 - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
 
 ex)
 let calculator = Calculator() // 객체생성
 
 calculator.value  // 0

 calculator.add(10)    // 10
 calculator.add(5)     // 15
 
 calculator.subtract(9)  // 6
 calculator.subtract(10) // -4
 
 calculator.multiply(4)   // -16
 calculator.multiply(-10) // 160
 
 calculator.divide(10)   // 16
 calculator.reset()      // 0
*/
 
class Calculator {
    var value: Int = 0
    
    func add(_ num: Int) -> Int {
        value += num
        return value
    }
    func subtract(_ num: Int) -> Int {
        value -= num
        return value
    }
    func multiply(_ num: Int) -> Int {
        value *= num
        return value
    }
    func divide(_ num: Int) -> Int {
        value /= num
        return value
    }
    func reset() {
        value = 0
    }
}

let calculator = Calculator()
calculator.value
calculator.add(10)
calculator.value
calculator.multiply(10)
calculator.divide(50)
calculator.value
calculator.reset()
calculator.value

/*
3. 첨부된 그림을 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
*/

class Square {
    var length: Int
    
    init(length: Int) {
        self.length = length
    }
    
    func area() -> Int {
        return length * length
    }
    func perimeter() -> Int {
        return length * 4
    }
}

class Rectangle {
    var length: Int
    var width: Int
    
    init(length: Int, width: Int) {
        self.length = length
        self.width = width
    }
    
    func area() -> Int {
        return length * width
    }
    func perimeter() -> Int {
        return length * 2 + width * 2
    }
}

class Circle {
    var radius: Int
    
    init(length: Int) {
        self.radius = length
    }
    
    func area() -> Double {
        return Double(radius) * 3.14 * Double(2)
    }
    func perimeter() -> Double {
        return Double(radius) * 3.14 * Double(radius)
    }
}

class Triangle {
    var length: Int
    var height: Int
    
    init(length: Int, height: Int) {
        self.length = length
        self.height = height
    }
    
    func area() -> Double {
        return Double(length * height / 2)
    }
}

class Trapeziod {
    var length: Int
    var width: Int
    var height: Int
    
    init(length: Int, width: Int, height: Int) {
        self.length = length
        self.width = width
        self.height = height
    }
    
    func area() -> Int {
        return ( height / 2 ) * ( length + height )
    }
}

class Cube {
    var length: Int
    
    init(length: Int, width: Int, height: Int) {
        self.length = length
    }
    
    func area() -> Int {
        return length * length * length
    }
}

class RectangularSolid {
    class Trapeziod {
        var length: Int
        var width: Int
        var height: Int
        
        init(length: Int, width: Int, height: Int) {
            self.length = length
            self.width = width
            self.height = height
        }
        
        func area() -> Int {
            return length * width * height
        }
    }
}

class CircularCylinder {
    var radius: Int
    var height: Int
    
    init(length: Int, height: Int) {
        self.radius = length
        self.height = height
    }
    
    func perimeter() -> Double {
        return Double(radius) * 3.14 * Double(radius) * Double(height)
    }
}

class Sphere {
    var radius: Int
    
    init(length: Int) {
        self.radius = length
    }
    
    func perimeter() -> Double {
        return Double(4 / 3) * 3.14 * Double(radius) * Double(radius) * Double(radius)
    }
}

class cone {
    var radius: Int
    var height: Int
    
    init(length: Int, height: Int) {
        self.radius = length
        self.height = height
    }
    
    func perimeter() -> Double {
        return (Double(radius) * 3.14 * Double(radius) * Double(height)) / 3
    }
}
