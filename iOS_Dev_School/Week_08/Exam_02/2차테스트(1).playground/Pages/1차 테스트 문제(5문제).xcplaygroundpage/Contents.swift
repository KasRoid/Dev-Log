//: [Previous](@previous)

/*
 다음의 클로져를 FullSyntax 로부터 Optimized Syntax 로 차근차근 줄여보세요.
 (최종 답만 적지 말고 하나씩 줄여갈 것)
 */

func performClosure(param: (String) -> Int) {
  param("Swift")
}

//func performClosure1(param: (String) -> Int) { (param: String) -> Int in return
//    param("Swift") }


/*
 자연수 하나를 입력받아 1년부터 그 해까지의 모든 윤년의 개수를 출력하는 함수
 (공식 : 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
 윤년X 예시 - 200, 300, 500, 600, 1900, 2100
 
 Intput : 2019
 Output : 윤년에 속하는 해는 총 489회입니다.
 */

func printTheNumberOfLeafYear(_ year: Int) {
    var leapYear = 0
    for i in 1...year {
        if i % 400 == 0 {
            leapYear += 1
        }
        else if i % 4 == 0 && i % 100 != 0 {
            leapYear += 1
        }
    }
  print("윤년에 속하는 해는 총 \(leapYear)회입니다.")
}

printTheNumberOfLeafYear(8)     // 2
printTheNumberOfLeafYear(100)   // 24
printTheNumberOfLeafYear(400)   // 97
printTheNumberOfLeafYear(2019)  // 489


/*
 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
 e.g.
 > Input : ["a", "b", "c", "a", "e", "d", "c", "a", "c", "f"]
 > Output : ["b", "e" ,"d", "f"]
 
 // sort 함수 사용하지 말 것
 */

func printUniqueValues(from arr: [String]) -> [String] {
    var resultArray: Array<String> = []
    var counter = 0
    for i in arr {
        for j in arr {
            if i == j {
                counter += 1
            }
        }
        if counter == 1 {
            resultArray.append(i)
        }
        counter = 0
    }
    
  return resultArray
}

let strArr = ["a", "b", "c", "a", "e", "d", "c", "a", "c", "f"]
print(printUniqueValues(from: strArr))   // b, e, d, f


/*
 자연수를 입력받아 그 숫자보다 작거나 같은 모든 소수와 그 개수를 출력하는 함수를 정의
 
 e.g.
 func checkPrimeNumbers(number: Int)
 > Input : 10
 > Output : 10보다 작거나 같은 소수는 [2, 3, 5, 7]이고, 총 4개입니다.
 */

func checkPrimeNumbers(number: Int) {
    var numberOfPrimeNumber: Array<Int> = []
    var counter = 0
    for i in 1...number {
        for j in 1...number {
            if i % j == 0 {
                counter += 1
            }
        }
        if counter == 2 {
            numberOfPrimeNumber.append(i)
        }
        counter = 0
    }
    print("\(number)보다 작거나 같은 소수는 \(numberOfPrimeNumber)이고, 총 \(numberOfPrimeNumber.count)개 입니다")
}

checkPrimeNumbers(number: 1)
checkPrimeNumbers(number: 10)   // 4개
checkPrimeNumbers(number: 100)  // 25개
checkPrimeNumbers(number: 1000) // 168개


/*
 구글(google), 카카오(kakao), 네이버(naver) 로그인을 위해 Site라는 이름의 Enum 타입을 만들고자 합니다.
 각 case는 사용자의 아이디(String)와 비밀번호(String)를 위한 연관 값(associated value)을  가집니다.
 그리고 Site 타입 내부에는 signIn()이라는 이름의 메서드를 만들어 다음과 같이 문자열을 출력하는 기능을 구현해보세요.
 
 e.g.
 enum Site {}
 > Input
 let google = Site.google("google@gmail.com", "0000")
 google.signIn()
 
 > Output
 구글에 로그인하였습니다. (아이디 - google@gmail.com, 비밀번호 - 0000)
 */

enum Site {
    case google(_ id: String, _ pw: String)
    case kakao(_ id: String, _ pw: String)
    case naver(_ id: String, _ pw: String)
    
    func signIn() {
        switch self {
        case .google:
            print("구글에 로그인하셨습니다.")
        case .kakao:
            print("카카오에 로그인하셨습니다")
        case .naver:
            print("네이버에 로그인하셨습니다")
        }
    }
}

let google = Site.google("google@gmail.com", "0000")
google.signIn()



//: [Next](@next)
