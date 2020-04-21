//: [Previous](@previous)
/*:
 ---
 ## Access Levels
 * open
 * public
 * internal
 * fileprivate
 * private
 ---
 */
//: [공식 문서](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)

/***************************************************
 Open / Public
 ***************************************************/

open class SomeOpenClass {
  open var name = "name"
  public var age = 20
}

public class SomePublicClass {
  public var name = "name"
  var age = 20
}

let someOpenClass = SomeOpenClass()
someOpenClass.name
someOpenClass.age

let somePublicClass = SomePublicClass()
somePublicClass.name
somePublicClass.age

//: ---
/***************************************************
 Internal
 ***************************************************/

class SomeInternalClass {
  internal var name = "name"
  internal var age = 0
}

//class SomeInternalClass {
//  var name = "name"
//  var age = 0
//}


let someInternalClass = SomeInternalClass()
someInternalClass.name
someInternalClass.age

//: ---
/***************************************************
 fileprivate
 ***************************************************/

class SomeFileprivateClass {
  fileprivate var name = "name"
  fileprivate var age = 0
}

let someFileprivateClass = SomeFileprivateClass()
someFileprivateClass.name
someFileprivateClass.age


//: ---

class SomePrivateClass {
  private var name = "name"
  private var age = 0
  
  func someFunction() {
    print(name)
  }
}

//let somePrivateClass = SomePrivateClass()
//somePrivateClass.someFunction()
//somePrivateClass.name
//somePrivateClass.age



/***************************************************
 1. Command Line Tool 로 체크
 2. UIViewController, Int 등 애플 프레임워크의 접근 제한자 확인
 ***************************************************/




/*:
 ---
 ## Nested Types
 * Private  ->  Fileprivate
 * Fileprivate  ->  Fileprivate
 * Internal  ->  Internal
 * Public  ->  Internal
 * Open  ->  Internal
 ---
 */
// 별도로 명시하지 않으면 someProperty는 Internal 레벨
// public도 동일
open class OClass {
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 Internal 레벨
// 더 높은 레벨을 설정할 수는 있지만,
// 애초에 클래스 자체에 접근할 수 있는 레벨이 낮으므로 의미 없음
internal class IClass {
  open var openProperty = 0
  public var publicProperty = 0
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 fileprivate 레벨
fileprivate class FClass {
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 fileprivate 레벨
private class PClass {
  var someProperty: Int = 0
}


//: [Next](@next)
