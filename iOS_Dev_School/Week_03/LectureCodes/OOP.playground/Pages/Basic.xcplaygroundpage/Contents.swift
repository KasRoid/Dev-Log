//: [Previous](@previous)
/*:
 # Class
 */

/*
 class <#ClassName#>: <#SuperClassName#>, <#ProtocolName...#> {
   <#PropertyList#>
   <#MethodList#>
 }
 
 let <#objectName#> = <#ClassName()#>
 objectName.<#propertyName#>
 objectName.<#functionName()#>
 */


class Dog {
  var color = "White"
  var eyeColor = "Black"
  var height = 30.0
  var weight = 6.0
  
  func sit() {
    print("sit")
  }
  func layDown() {
    print("layDown")
  }
  func shake() {
    print("shake")
  }
}


let bobby: Dog = Dog()
bobby.color
bobby.color = "Gray"
bobby.color
bobby.sit()

let tory = Dog()
tory.color = "Brown"
tory.layDown()


/*:
 ---
 ### Question
 - 자동차 클래스 정의 및 객체 생성하기
 ---
 */
/*
 자동차 클래스
 - 속성: 차종(model), 연식(model year), 색상(color) 등
 - 기능: 운전하기(drive), 후진하기(reverse) 등
 */






/*:
 ---
 ### Answer
 ---
 */
class Car {
  let model = "Tesla Model X"
  let modelYear = 2020
  let color = "Cream White"
  
  func drive() {
    print("전진")
  }
  func reverse() {
    print("후진")
  }
}

let car = Car()
car.drive()
car.reverse()



//: [Next](@next)
