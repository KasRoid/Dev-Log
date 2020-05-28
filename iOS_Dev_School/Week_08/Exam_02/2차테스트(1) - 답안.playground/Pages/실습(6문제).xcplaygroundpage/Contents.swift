import UIKit

/*
 < 1번 문제 >
 스토리보드를 이용하지 않을 때 window를 생성하고 초기 ViewController를 전달하는 코드 작성
 
 1. iOS 13 이상 - SceneDelegate.swift 일 때
 2. iOS 12 이하 - AppDelegate.swift 일 때
 */

print("\n---------- [ 1번 문제 ] ----------\n")

class ViewController: UIViewController {}


// 1번
class SceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }
}


// 2번
class AppDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }
}



/*
 < 2번 문제 >
 2개의 탭을 가진 탭바 컨트롤러를 반환하되,
 첫번째 탭은 내비게이션 컨트롤러가 포함된 뷰컨트롤러로 구성하고 탭바아이템의 타이틀은 First,
 두번째 탭은 기본 뷰컨트롤러가 들어 있도록 구성하고 탭바아이템의 타이틀은 Second.
 그 외 내용은 알아서 구성
 */

print("\n---------- [ 2번 문제 ] ----------\n")

func makeTabBarController() -> UITabBarController {
    let tabBarController = UITabBarController()
    
    let firstVC = ViewController()
    let navigationController = UINavigationController(rootViewController: firstVC)
    navigationController.tabBarItem = UITabBarItem(title: "First", image: nil, tag: 0)
    
    let secondVC = ViewController()
    //  secondVC.tabBarItem = UITabBarItem(title: "Second", image: nil, tag: 1)
    secondVC.title = "Second"  // 별도로 tabBarItem을 지정하지 않으면 이것으로 타이틀 설정
    
    tabBarController.viewControllers = [navigationController, secondVC]
    return tabBarController
}



/*
 < 3번 문제 >
 다음 그림을 참고하여 오토레이아웃을 코드로 구성 (view는 safeArea 기준)
 
 --------------
 |    50        |
 |   -----      |
 |50|  A  | 200 |
 |  |     |     |
 |   -----      |
 |     50       |
 |   --------   |
 |  |   B    |  |  B의 너비 = 250
 |  |        |  |  B의 높이 = A의 높이 * 1.5
 |  |        |  |  B의 leading = A의 leading
 |   --------   |
 |     150      |
 --------------
 */

print("\n---------- [ 3번 문제 ] ----------\n")

    final class AutoLayoutViewController: UIViewController {
        
        let redView = UIView()    // A
        let greenView = UIView()  // B
        
        override func viewDidLoad() {
            super.viewDidLoad()
            redView.backgroundColor = .red
            greenView.backgroundColor = .green
            
            // 1) 뷰 계층구조에 추가 (addSubview)
            view.addSubview(redView)
            view.addSubview(greenView)
            
            // 2) translatesAutoresizingMaskIntoConstraints 비활성화
            redView.translatesAutoresizingMaskIntoConstraints.toggle()
            greenView.translatesAutoresizingMaskIntoConstraints.toggle()
            
            // 3) 제약 조건 설정
            NSLayoutConstraint.activate([
                redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
                redView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -200),
                
                greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 50),
                greenView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 0),
                greenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
                greenView.widthAnchor.constraint(equalToConstant: 250),
                greenView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1.5),
            ])
        }
    }




/*
 < 4번 문제 >
 손님, 바리스타, 커피 클래스를 각각 정의하고
 손님이 바리스타에게 커피를 주문하는 기능 구현하기
 
 [ Class ]
 ** 손님 (Customer)
 - 필수 속성: 이름(name)
 - 필수 메서드: 주문하기( func order(menu: CoffeeMenu, to barista: Barista) )
 
 ** 바리스타 (Barista)
 - 필수 속성: 이름(name)
 - 필수 메서드: 커피 만들기( func makeCoffee(menu: CoffeeMenu) -> Coffee )
 
 ** 커피 (Coffee)
 - 필수 속성: 이름(name), 가격(price)
 
 [ Enumeration ]
 ** 커피 메뉴 (CoffeeMenu)
 - case: americano, latte, cappuccino
 
 e.g.
 let customer = Customer(name: "손님A")
 let barista = Barista(name: "바리스타A")
 customer.order(menu: .americano, to: barista)
 
 Output: 손님A이(가) 바리스타A에게 2000원짜리 Americano을(를) 주문하였습니다.
 */

print("\n---------- [ 4번 문제 ] ----------\n")

class Customer {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    func order(menu: CoffeeMenu, to barista: Barista) {
        let coffee = barista.makeCoffee(menu: menu)
        print("\(name)이(가) \(barista.name)에게 \(coffee.price)원짜리 \(coffee.name)을(를) 주문하였습니다.")
    }
}

class Barista {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    func makeCoffee(menu: CoffeeMenu) -> Coffee {
        let price: Int
        switch menu {
        case .americano: price = 2000
        case .latte: price = 2500
        case .cappuccino: price = 3000
        }
        return Coffee(name: menu.rawValue, price: price)
    }
}


enum CoffeeMenu: String {
    case americano = "Americano"
    case latte = "Latte"
    case cappuccino = "Cappuccino"
}

class Coffee {
    let name: String
    let price: Int
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

let customer = Customer(name: "손님A")
let barista = Barista(name: "바리스타A")
customer.order(menu: .americano, to: barista)
// 손님A이(가) 바리스타A에게 2000원짜리 Americano을(를) 주문하였습니다.



/*
 < 5번 문제 >
 문제를 읽고 요구에 맞게 구현하기
 
 문제:
 주어진 숫자에 대해 10의 숫자 단위로 그룹으로 묶고, 각 그룹의 데이터는 해당 범위 내의 숫자들로 구성
 
 Input 1: Array(1...100)
 Input 2: [0, 3, 9, 15, 27, 33, 41, 49, 90, 98]
 Output:
 아래와 동일한 형식으로 출력하며, 그룹의 숫자는 오름차순으로 출력되어야 함.
 값이 하나도 없는 그룹은 제외하고 출력
 
 e.g.
 1) Input 1 일 때
 Group: 0  -  Value: [1, 2, 3, 4, 5, 6, 7, 8, 9]
 Group: 1  -  Value: [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
 ....
 Group: 10  -  Value: [100]
 
 2) Input 2 일 때 - 값이 하나도 없는 그룹은 제외하고 출력
 Group: 0  -  Value: [0, 3, 9]
 ...
 Group: 4  -  Value: [41, 49]
 Group: 9  -  Value: [90, 98]
 */

let data1 = Array(1...100)
let data2 = [0, 3, 9, 15, 27, 33, 41, 49, 90, 98]

print("\n---------- [ 5번 문제 ] ----------\n")

func sortOut(numbers: [Int]) -> [Int: [Int]] {
    var groupDict: [Int: [Int]] = [:]
    
    for i in numbers {
        if let _ = groupDict[i / 10] {
            groupDict[i / 10]?.append(i)
        } else {
            groupDict[i / 10] = [i]
        }
    }
    return groupDict
}

let groupDict = sortOut(numbers: data2)
for group in groupDict.keys.sorted() {
    print("Group: \(group)  -  Value: \(groupDict[group]!)")
}



/*
 < 6번 문제 >
 아래 코드가 요구조건에 맞게 동작하도록 구현
 */

print("\n---------- [ 6번 문제 ] ----------\n")


struct User {
    var friends: [Friends] = []
    var blocks: [Friends] = []
}

struct Friends: Equatable  {
    let name: String
}

struct FriendList {
    private(set) var user: User
    
    mutating func addFriend(name: String) {
        let friend = Friends(name: name)
        user.friends.append(friend)
    }
    
    mutating func blockFriend(name: String)  {
        let friend = Friends(name: name)
        
        // Friends에 Equatable 프로토콜을 적용하면 firstIndex(of:) 메서드 사용 가능
        // Equatable 프로토콜 미적용 시 firstIndex(where:) 메서드를 이용해 구현
        if let index = user.friends.firstIndex(of: friend) {
            user.friends.remove(at: index)
        }
        if !user.blocks.contains(friend) {
            user.blocks.append(friend)
        }
    }
    
    func retrieveUser() -> User {
        user
    }
}


var user = User()

var friendList = FriendList(user: user)
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")

user = friendList.retrieveUser()
user.friends

friendList.blockFriend(name: "정우성")
user = friendList.retrieveUser()
user.friends
user.blocks





/*
 수고하셨습니다!
 */



