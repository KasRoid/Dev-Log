//: [Previous](@previous)
import Foundation
/*:
 # Property
 */
/*:
 ---
 ## Stored Property
 - Class ⭕️   Structure ⭕️   Enumeration ❌
 ---
 */
class StoredProperty {
  var width = 0.0
  var height = 0.0
}

let stored = StoredProperty()
stored.width = 123
stored.height = 456
stored.width
stored.height

/*:
 ---
 ## Lazy Stored Property
 - 초기값이 인스턴스의 생성이 완료 될 때까지도 알 수 없는 외부 요인에 의존 할 때
 - 초기값이 복잡하거나 계산 비용이 많이 드는 설정을 필요로 할 때
 - 필요한 경우가 제한적일 때
 - Class ⭕️   Structure ⭕️   Enumeration ❌
 ---
 */
print("\n---------- [ Lazy Property ] ----------\n")

class BasicStoredProperty {
  var width = 10.0
  var height = 20.0
  
  var area = 200.0
//  var area = self.width * self.height
}

let basicStored = BasicStoredProperty()
basicStored.area
basicStored.width = 30
basicStored.area



class LazyStoredProperty {
  var width = 10.0
  var height = 20.0
  
  // 1. 외부 요인이나 다른 설정에 기반
//  var area = self.width * self.height
  lazy var area = width * height // self 는 메모리에 저장되어 있는 값에 접근을 해야하는데 area 가 아직 메모리에 저장되지 않았으므로 lazy 를 사용하여야한다.
  
  // 2. 계산 비용이 많이 드는 상황
//  var hardWork = "실행하면 약 10초 이상 걸려야 하는 작업"
  
  // 3. 필요한 경우가 제한적인 상황
//  func ifStatement() {
//    if true {   // 5%
//      print(area)
//    } else {    // 95%
//      print(width)
//    }
//  }
}

let lazyStored = LazyStoredProperty()
lazyStored.width = 30
lazyStored.area


// 순서 주의, 단 lazy 는 최초에 실행될 때 한번 값을 저장하게된다. 즉 다시 계산을 하지 않는다.
let lazyStored1 = LazyStoredProperty()
lazyStored1.area
lazyStored1.width = 30
lazyStored1.area


/*:
 ---
 ## Computed Property
 - 자료를 저장하지 않고 매번 호출할 때마다 새로 계산
 - Class ⭕️   Structure ⭕️   Enumeration ⭕️
 ---
 */
/*
  var <#variable name#>: <#type#> {
      get {
          <#statements#>
      }
      set {
          <#variable name#> = newValue
      }
  }
 */


print("\n---------- [ Computed Property ] ----------\n")

class ComputedProperty {
  var width = 5.0
  var height = 5.0
  
  lazy var lazyArea = width * height // 지연프로퍼티
  var area: Double { // 연산프로퍼티, 지연프로퍼티와는 다르게 계속 계산이 가능하다. get 이 생략되어 있는 형태이다.
    width * height
  }
  
  // Stored + Computed get(read), set(write)
  private var _koreanWon = 0.0
  var wonToDollar: Double {
    get {
      return _koreanWon / 1136.5
    }
    set {
      // newValue: 새로 들어오는 값
      _koreanWon = newValue
    }
  }
}

var computed = ComputedProperty()
computed.area
computed.lazyArea

computed.width = 10
computed.area
computed.lazyArea

computed.lazyArea = 50.0 // 직접 바꾸면 값을 바꿀 수는 있다.
computed.lazyArea

computed.width = 20
computed.height = 20
computed.area
computed.lazyArea

computed.wonToDollar
computed.wonToDollar = 10000
computed.wonToDollar


/*:
 ---
 ## Property Observer
 - Class ⭕️   Structure ⭕️   Enumeration ❌
 ---
 */
/*
 var <#variable name#>: <#type#> = <#value#> {
     willSet {
         <#statements#>
     }
     didSet {
         <#statements#>
     }
 }
 */

print("\n---------- [ Property Observer ] ----------\n")

class PropertyObserver {
  var height = 0.0
  
  var width = 0.0 {
    willSet {
      print("willSet :", width, "->", newValue)
      // width = 0.0,  newValue = 50.0
    }
    
    // 변경되는 시점  willSet <-> didSet 중간
    
    didSet {
      height = width / 2
      print("didSet :", oldValue, "->", width)
      // oldValue = 0.0,  width = 50.0
    }
  }
}

var obs = PropertyObserver()
obs.height = 50
obs.width = 50


/*:
 ---
 ## Type Property
 - Shared
 - Lazily Initialized
 - Class ⭕️   Structure ⭕️   Enumeration ⭕️
 ---
 */
/*
 선언 - static let(var) <#propertyName#>: <#Type#>
       class var <#propertyName#>: <#Type#> { return <#code#> }
 사용 - <#TypeName#>.<#propertyName#>
 
 static: override 불가
 class: 클래스에서만 사용 가능하고 computed property 형태로 사용. 서브클래스에서 override 가능
 */

print("\n---------- [ Type Property ] ----------\n")

class TypeProperty { // 전체적인 데이터를 바꿀 때 사용한다.
  static var unit: String = "cm" // 타입프로퍼티 선언
  var width = 5.0
}

let square = TypeProperty()
square.width

let square1 = TypeProperty()
square1.width = 10.0
square1.width

TypeProperty.unit
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")

TypeProperty.unit = "m"
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")



//: [Next](@next)
