//: [Previous](@previous)
import Foundation


/*
 1) 업캐스팅과 다운캐스팅에 대하여 설명하고,
 2) 업캐스팅과 다운캐스팅을 시도할 때 사용하는 키워드에 대해 각각 설명
 
 업캐스팅 - SubClass(자식) 가 SuperClass(부모) 처럼 행동할 수 있도록 하는 것, 업캐스팅은 반드시 성공하므로 as 로 변환할 수 있다.
 다운캐스팅 - SuperClass 가 SubClass 처럼 행동할 수 있도록 하는 것, 다운캐스팅은 실패할 수 있다. 즉 as?(optional) 이나 as!(강제) 로 변환을 시도해야 한다.
 */





/*
 TableView에서 셀을 재사용할 때 사용되는 아래의 두 메서드가 각각
 1) 언제 사용되고  2) 차이점은 무엇인지에 대하여 작성
 - dequeueReusableCell(withIdentifier:)
 - dequeueReusableCell(withIdentifier:for:)
 
  테이블 뷰에서 스크롤 시 셀을 재사용할 때 identifier 로 재사용할 수 있는 셀을 구분할 수 있게 설정한다.
 */





/*
 safeAreaInsets  /  safeAreaLayoutGuide 의 차이점에 대해 작성
 
 
 */





/*
 Strong Reference Cycle 에 대해 1) 설명하고 2) 예시 코드 작성
 
 1) Strong Reference Cycle 은 각 프로퍼티가 서로를 참조하여 ARC 가 0 이 되지 못하여 메모리에서 벗어날 수 없는 현상이다. 스토리보드에서 생성한 오브젝트를 코드로 옮겨놓을 때 변수를 weak 으로 선언하지 않으면 Strong Reference Cycle 이 발생한다. delegate 선언 시에도 weak 을 사용하지 않으면 Strong Reference Cycle 이 발생한다. 서로가 서로를 참조할 때 한쪽에는 weak 을 명시하여 ARC 가 0 이 될 수 있도록 만들어 주어야 한다.
 
 2) 스토리보드에서 UIView 를 소스에 연결하였을 때
    @IBOutlet var myUIView: UIView   <- Strong Reference Cycle 발생
 */




/*
 Strong, Unowned, Weak 각각의 특징과 차이점에 대해 설명
 
 Strong: 일반적인 변수 선언 시 자동적으로 적용되며 ARC 가 1 증가한다.
 Unowned: 따로 명시해야하며 ARC 를 증가시키지 않는다. 다만 오류가 발생할 수 있다.
 Weak: 역시 따로 명시해야하며 ARC 를 증가시키지 않는다. 오류로부터 안전하다.
 */





/*
 Intrinsic Content Size란 무엇이고 어떤 특징을 가지는지 설명
 
 어떠한 오브젝트가 이미 높이나 넓이 등에 지정된 값을 갖고 있는 경우를 말한다. 예를들어 slider 오브젝트에는 지정 높이가 구현되어 있어 오토레이아웃 설정시 넓이 부분만 설정해주면 오류가 발생하지 않는다.
 */




/*
 A, B, C 3개의 ViewController가 다음과 같은 상황일 때
 ============================
 A ---------> B ---------> C
    present      present
 ============================
 A, B, C 각각의 presentingViewController, presentedViewController의 상태는?
 
 
 A: PresentingViewController: B
    PresentedViewController: 없음
 
 B: PresentingViewController: C
    PresentedViewController: A
 
 C: PresentingViewController: 없음
    PresentedViewController: B
 */

//: [Next](@next)
