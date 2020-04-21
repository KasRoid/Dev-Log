//: [Previous](@previous)
/*:
 ---
 # Encapsulation
 ---
 */
class 회사 {
  let 직원1: 직원 = 직원()
  let 직원2: 직원 = 직원()
}
class 직원 {
  private func 밤샘() {}
  private func 코피() {}
  
  func 결과물산출() {}
}

let company = 회사()
company.직원1.결과물산출()
company.직원2.결과물산출()





/***************************************************
 Q. 캡슐화 적용해보기
 - A가 서울에서 부산까지 여행을 가기로 함
 - A의 현재 위치는 currentLocation 이라는 메서드를 통해서만 확인 가능
 - 부산으로 이동하는 동작(메서드)을 구현하고 위치의 변경은 이 메서드를 통해서만 가능
 - 부산까지 이동하는 도중에 다른 일들을 할 수 있지만 A 클래스 외부에서는 자세한 내용은 알거나 직접 건드리지 못 함
 ***************************************************/


class A {
    private var location = "Seoul"
    private var happiness = 0
    
    private func eatSnack() {
        happiness += 2
    }
    private func takeSleep() {
        happiness += 1
    }
    private func lostWallet() {
        happiness -= 10
    }
    private func myStat() {
        print(happiness)
    }
    
    func currentLocation() {
        print(location)
    }
    func goToBusan() {
        eatSnack()
        takeSleep()
        location = "Busan"
    }
}

let a = A()
a.currentLocation()
a.goToBusan()
a.currentLocation()







/*:
 ---
 ### Answer
 ---
 */


class B {
  private var location = "서울"
  
  private func doSomething1() {
    print("잠시 휴게소에 들려서 딴짓")
  }
  private func doSomething2() {
    print("한숨 자다 가기")
  }
  
  func currentLocation() {
    print("====")
    print("현재 위치 :", location)
    print("====")
  }
  
  func goToBusan() {
    print("서울을 출발합니다.")
    doSomething1()
    doSomething2()
    print("부산에 도착했습니다.")
    location = "부산"
  }
}

let b = B()
b.currentLocation()
b.goToBusan()
b.currentLocation()



/***************************************************
 > B의 현재 위치 확인 - 부산으로 이동 (이동한다는 사실 외의 일은 모름) - 현재 위치 확인
 > 선풍기 현재 상태 확인 - 선풍기 풍속 조절 (내부의 일은 모름) - 현재 상태 확인
 - 두 가지는 동일함. 정보 은닉화의 개념
 
 B 라는 사람에 관련된 상태값(프로퍼티), 그리고 그 사람에게 관련된 행동(메서드)만 모아서
 B 라는 클래스로 저장하는 것
 - 데이터 캡슐화의 개념
 ***************************************************/



//: [Next](@next)
