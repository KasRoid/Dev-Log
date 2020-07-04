//: [Previous](@previous)
import Foundation


/*
 try, try?, try! 의 공통점과 차이점
 
 공통점
 에러 핸들링, throw 로 인해 에러 핸들링이 필요한 경우 try 를 사용하여 에러 처리를 할 수 있다.
 
 차이점
 
 try 는 do, catch 와 함게 사용하며 안정적으로 오류처리가 가능하다.
 try! 는 100% 안전한 경우에 사용하면 문제가 없으나 이외에 에러가 발생할 경우 앱이 종료된다.
 try? 는 nil 값을 반환한다.
 
 */



/*
 forEach, map, filter, reduce에 대해 설명
 
 forEach - array 와 같은 데이터의 집합의 element 를 하나씩 꺼내와 순환 시킨다. for 와 비슷한 개념이나 break 와 같은 control 을 사용할 수 없다.
 map - 데이터의 집합을 하나씩 순환하며 프로그래머가 의도한대로 데이터를 변형시킨 후 새로운 집합을 반환한다.
 filter - 데이터의 집합에 특정 조건을 걸고 해당 조건에 부합하는 값만 새로운 데이터 집합으로 반환한다.
 reduce - 데이터의 집합의 값을 모두 합쳐 하나의 데이터로 반환한다. reduce(0){} 과 같은 형태로 초깃값을 설정할 수 있다.
 
 
 */



/*
 Geocode와 Reverse Geocode의 차이
 
 지도가 고정되어있고 pin 이 움직이는지, pin 은 고정되어있고 지도가 움직이는지의 차이
 
 */



//: [Next](@next)
