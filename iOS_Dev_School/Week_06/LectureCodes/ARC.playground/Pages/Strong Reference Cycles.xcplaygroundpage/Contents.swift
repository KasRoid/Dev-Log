//: [Previous](@previous)
/*:
 ---
 # Strong Reference Cycles
 ---
 */

class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person? = Person() // count 1
var tory: Dog? = Dog() // count 1

giftbot?.pet = tory // Dog - count 2
tory?.owner = giftbot // Person - count 2

giftbot = nil // Person - count 2
tory = nil // Dog - count 1

/*:
 ---
 ### Question
 - 두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?
 ---
 */








/*:
 ---
 ### Answer
 ---
 */
// 순서 주의
// 순서가 바뀌면 상위값이 nil 이 되어 하위값에 접근할 수 없다.

giftbot?.pet = nil
tory?.owner = nil

giftbot = nil
tory = nil




//: [Next](@next)
