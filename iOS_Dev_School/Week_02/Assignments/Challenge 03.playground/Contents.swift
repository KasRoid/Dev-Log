import UIKit

/*
 [ 도전 과제 ]
 1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
 각 케이스에는 Double 타입의 Associated Value 를 받도록 함

 추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
 섭씨 = (화씨 - 32) * 5 / 9
 섭씨 = 켈빈 + 273
  
 enum Temperature {
   // 코드
 }
 */


// Associated value 를 사용한 문제 풀이
enum Temperature {
    case celcius(Double), fahrenheit(Double), kelvin(Double)
    
    func toCelcius() -> Double {
        switch temp {
        case .fahrenheit(let x):
            return (x - 32) * 5 / 9
        case .kelvin(let x):
            return x + 273
        case .celcius(let x):
            return x
        }
    }
}

var temp = Temperature.fahrenheit(80)
temp = Temperature.kelvin(-250)

temp.toCelcius()



// 추가적으로 풀어본 다른 방식
//enum Temperature: Double {
//    case celcius, fahrenheit, kelvin
//
//    func toCelcius(temp: Double) -> Double {
//        switch self {
//        case .fahrenheit:
//            return (temp - 32) * 5 / 9
//        case .kelvin:
//            return temp + 273
//        default:
//            return temp
//        }
//    }
//}
//
//var fahrenheitTemp = Temperature.fahrenheit
//var kelvinTemp = Temperature.kelvin
//
//fahrenheitTemp.toCelcius(temp: 80)
//kelvinTemp.toCelcius(temp: -250)
