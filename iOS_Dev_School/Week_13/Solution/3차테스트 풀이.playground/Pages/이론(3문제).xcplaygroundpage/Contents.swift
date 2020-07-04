//: [Previous](@previous)
import Foundation


/*
 try, try?, try! 의 공통점과 차이점
 */

/*
 공통점 : throws 키워드가 사용된 함수를 사용할 때 오류 발생에 대비해 처리 방법을 결정
 
 try : do ~ catch 구문 내에서만 사용하며 오류 발생 시에는 catch문에서 처리
 try? : Optional 값을 반환하며 오류 발생 시 nil 반환. do ~ catch 필요 X
 try! : Optional 강제 언래핑. 오류 발생 시 앱 종료. do ~ catch 필요 X
 */


/*
 forEach, map, filter, reduce에 대해 설명
 */

/*
 forEach - 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태
 map - 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환
 filter - 컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환
 reduce - 컬렉션의 각 요소들을 결합하여 지정한 결과 타입으로 반환.   e.g. Int, String, [Int] 등
 */


/*
 Geocode와 Reverse Geocode의 차이
 */

/*
 Geocode : Placemark —> Coordinate  (지명을 좌표로 변환)
 Reverse Geocode : Coordinate —> Placemark  (좌표를 지명으로 변환)
*/


//: [Next](@next)
