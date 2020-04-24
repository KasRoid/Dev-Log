## Assignments for Week 03 Day 4 ##

### Date: 2020.04.24 ###

#### Assignment 04 ####

1. 입력받은 숫자의 모든 자리 숫자 합계를 출력하기
e.g.  123 -> 6 ,  5678 -> 26

```Swift
func sumOfDigits (num: Int) -> Int {
    var input = num
    var arrInput: Array<Int> = []
    var result: Int = 0
    
    while input > 0 {
        arrInput.append(input % 10)
        input /= 10
    }
    for i in arrInput {
        result += i
    }
    return result
}

sumOfDigits(num: 123)
```


2. 하샤드 수 구하기
- 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수
e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수.

```Swift
func harshadNum (num: Int) -> Bool {
    var input = num
    var arrInput: Array<Int> = []
    var sumOfInput: Int = 0
    var result: Bool
    
    while input > 0 {
        arrInput.append(input % 10)
        input /= 10
    }
    
    for i in arrInput {
        sumOfInput += i
    }
    
    result = num % sumOfInput == 0 ? true : false
    return result
}

harshadNum(num: 18)
```

---
## Assignments for Week 03 Day 2 ##

### Date: 2020.04.21 ###

#### Assignment 03 ####

1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2
*/

```Swift
var result = 0

func calculateOneToInput(input: Int) -> Int {
    if input >= 1 {
        for i in 1...input {
            result += i
        }
    }
    else {
        for i in input...1 {
            result += i
        }
    }
    return result
}

calculateOneToInput(input: -2)

```

2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...

```Swift
func printWithFilter (input: Int) {
    
    for i in 1...input {
        var placeHolder = i
        var arr: Array<Int> = []
        
        while placeHolder > 0 {
            arr.append(placeHolder % 10)
            placeHolder /= 10
        }
        
        if arr.contains(3) || arr.contains(6) || arr.contains(9) {
            print("*")
        }
        else {
            print(i)
        }
    }
}

printWithFilter(input: 10)
```

3. 3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
e.g.  Input : 6, 9   ->  Output : 18, 3
 
최대공약수
1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복

최소 공배수
- 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수

```Swift
func findNums (input1: Int, input2: Int) -> [Int] {
    var arrOfResult: Array<Int> = []
    var inputGcf: Array<Int> = []
    var finalGcf: Array<Int> = []
    
    if input1 < input2 {
        for i in 1...input1 {
            if input1 % i == 0 {
                inputGcf.append(i)
            }
        }
        for i in inputGcf {
            if input2 % i == 0 {
                finalGcf.append(i)
            }
        }
    }
    else {
        for i in 1...input2 {
            if input2 % i == 0 {
                inputGcf.append(i)
            }
        }
        for i in inputGcf {
            if input1 % i == 0 {
                finalGcf.append(i)
            }
        }
    }
    arrOfResult.append(finalGcf.last!)
    arrOfResult.append(input1 * input2 / finalGcf.last!)
    
    
    print("최소공배수: \(arrOfResult[1]), 최대공약수: \(arrOfResult[0])")
    return arrOfResult
}

findNums(input1: 6, input2: 9)
```


---
## Assignments for Week 03 Day 2 ##

### Date: 2020.04.21 ###

#### Assignment 02 ####

![Assignment 02](https://user-images.githubusercontent.com/41736472/79845218-ad8bc300-83f7-11ea-9602-199624abaa57.png)

```Swift
class Animal {
    var type = "mammalia"
    var arms: Int
    var legs = 0
    var speed = 0
    
    func walk() {
        let distance = speed * legs
        print("Speed: \(speed), Legs: \(legs)")
        print(distance)
    }
    
    init(arms: Int) {
        self.arms = arms
    }
}


class Person: Animal {
    override var legs: Int {
        get {
            return super.legs + 2
        }
        set {}
    }
    
    override var speed: Int {
        get {
            return super.speed + 5
        }
        set {}
    }
    
    func say(say: String) {
        print(say)
    }
    
    override func walk() {
        print("I'm waling...")
        super.walk()
    }
}

class Pet: Animal {
    override var legs: Int {
        get {
            return super.legs + 4
        }
        set {}
    }
    override var speed: Int {
        get {
            return super.speed + 5
        }
        set {}
    }
}

class Dog: Pet {
    override var speed: Int {
        get {
            super.speed + 5
        }
        set {}
    }
}

class Cat: Pet {
    override var speed: Int {
        get {
            super.speed + 3
        }
        set {}
    }
    override func walk() {
        print("Meyao")
        super.walk()
    }
}

var myPerson = Person(arms: 2)
myPerson.walk()

var myDog = Dog(arms: 0)
myDog.walk()

var myCat = Cat(arms: 0)
myCat.walk()
```

---
## Assignments for Week 03 Day 1 ##

### Date: 2020.04.20 ###

#### Assignment 01 ####

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

```Swift
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
```

2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
 
 ** 계산기 (Calculator)
 - 속성: 현재 값
 - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화

```Text 
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
```

 ```Swift
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
```

1. 첨부된 그림을 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
![image](https://user-images.githubusercontent.com/41736472/79734721-232d5b80-8332-11ea-89ce-b1f701e6e245.png)

```Swift
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
```