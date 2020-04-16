//: [Previous](@previous)
/*:
 ---
 # Enumerations
 - 연관된 값의 그룹에 대해 공통 타입을 정의한 뒤 type-safe 하게 해당 값들을 사용 가능
 ---
 */
let north = "north"
let south = "south"
let east = "east"
let west = "west"


enum CompassPoint {
  case north
  case south
  case east
  case west
}

// 열거형 타입의 이름은 Pascal Case
// 각각의 case는 Camel Case


var directionToHead1 = CompassPoint.west
directionToHead1 = .east

var directionToHead2: CompassPoint = .north



enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}





/*:
 ## Matching Enumeration Values
 */

let directionToHead = CompassPoint.south

switch directionToHead {
case .north:
  print("Lots of planets have a north")
case .south:
  print("Watch out for penguins")
case .east:
  print("Where the sun rises")
case .west:
  print("Where the skies are blue")
}


let enumTypeAnnotation: Planet = .mars
let somePlanet = Planet.earth

switch somePlanet {
case .earth:
  print("Mostly harmless")
default:
  print("Not a safe place for humans")
}



/*:
 ---
 ## Associated Values
 ---
 */
print("\n---------- [ Associated Values ] ----------\n")


enum OddOrEven {
  case odd(Int)
  case even(Int)
}

var number = OddOrEven.even(20)
number = OddOrEven.odd(13)

number
type(of: number)


switch number {
case .odd(let x):
    print("홀수 :", x)
case .even(let x):
    print("짝수 :", x)
}

switch number {
case let .odd(x): print("홀수 :", x)
case let .even(x): print("짝수 :", x)
}




enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

productBarcode
type(of: productBarcode)


switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
  print("QR code: \(productCode).")
}



/*:
 ---
 ### Question
 - enum Month { case jan, feb } 정의하되 2월은 윤년인지 아닌지 정보를 저장할 수 있도록 구현
 ---
 */
// 하단 Answer 참고

enum Month {
    case January(Int)
    case February(Int)
}


/*:
 ---
 ## Raw Value
 - Strings, Characters, or any of the Integer or Floating-point number types
 - raw value 는 해당 Enumeration 내에서 반드시 고유한 값이어야 함.
 ---
 */

enum Weekday: Int {
  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

Weekday.wednesday
Weekday.wednesday.rawValue


enum WeekdayName: String {
  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

WeekdayName.monday
WeekdayName.monday.rawValue


enum Gender: String {
  case male = "남자", female = "여자", other = "기타"
}

Gender.male
Gender.male.rawValue

/*:
 ---
 ### Question
 - 학점(A, B, C, D, F)을 enum 으로 표현하고 각 케이스에 알맞은 0.0 ~ 4.0 까지의 값 부여
 ---
 */
// 하단 Answer 참고

enum Grader: Double {
    case A = 4.0, B = 3.0, C = 2.0 , D = 1.0, F = 0.0
}

Grader.A
Grader.A.rawValue
/*:
 ---
 ### Implicitly Assigned Raw Values
 ---
 */

enum WeekdayAgain: Int {
  case sunday = 5, monday, tuesday, wednesday, thursday, friday, saturday
//  case sunday, monday = 100, tuesday = 101, wednesday, thursday, friday, saturday
//  case sunday = 1, monday = 1, tuesday = 2, wednesday, thursday, friday, saturday
}

WeekdayAgain.sunday
WeekdayAgain.sunday.rawValue

WeekdayAgain.wednesday
WeekdayAgain.wednesday.rawValue



enum WeekdayNameAgain: String {
  case sunday, monday = "mon", tuesday = "tue", wednesday, thursday, friday, saturday
}

WeekdayNameAgain.tuesday
WeekdayNameAgain.tuesday.rawValue

WeekdayNameAgain.wednesday
WeekdayNameAgain.wednesday.rawValue


/*:
 ---
 ### Initializing from a Raw Value
 ---
 */
print("\n---------- [ Initializing from a Raw Value ] ----------\n")

enum PlanetIntRaw: Int {
  case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}

PlanetIntRaw.venus
PlanetIntRaw.venus.rawValue

PlanetIntRaw(rawValue: 5)
PlanetIntRaw(rawValue: 7)

//PlanetIntRaw(rawValue: 0)
//PlanetIntRaw(rawValue: 15)



let positionToFind = 7
//let positionToFind = 11

if let somePlanet = PlanetIntRaw(rawValue: positionToFind) {
  switch somePlanet {
  case .earth:
    print("Mostly harmless")
  default:
    print("Not a safe place for humans")
  }
} else {
  print("There isn't a planet at position \(positionToFind)")
}



/*:
 ---
 ## Nested
 ---
 */
print("\n---------- [ Nested ] ----------\n")


enum Device: String {
  case iPhone, iPad, tv, watch
  
  func printType() {
    switch self {
    case .iPad, .iPhone, .tv:
      print("device :", self)
    case .watch:
      print("apple Watch")
    }
  }
}

let iPhone = Device.iPhone
iPhone.printType()




enum Wearable {
  enum Weight: Int {
    case light = 1
    case heavy = 3
  }
  
  case helmet(weight: Weight)
  case boots
  
  func info() -> Int {
    switch self {
    case .helmet(let weight):
      return weight.rawValue * 2
    case .boots:
      return 3
    }
  }
}


let boots = Wearable.boots
boots.info()

var woodenHelmet = Wearable.helmet(weight: .light)
woodenHelmet.info()

var ironHelmet = Wearable.helmet(weight: .heavy)
ironHelmet.info()



/*:
 ---
 ## Mutating
 - enum 타입 내부 함수에서 자기 자신의 값을 변경해야 할 경우 mutating 키워드 필요
 ---
 */

enum Location {
  case seoul, tokyo, london, newyork
  
//  func travelToLondon() {
//    self = .london
//  }
  
//  mutating func travelToTokyo() {
//    self = .tokyo
//  }
  
//  mutating func travel(to location: Location) {
//    self = location
//  }
  
//  mutating func travelToNextCity() {
//    switch self {
//    case .seoul: self = .tokyo
//    case .tokyo: self = .newyork
//    case .newyork: self = .london
//    case .london: self = .seoul
//    }
//  }
}

var location = Location.seoul
location

//location.travelToTokyo()
//location

//location.travel(to: .london)
//location

//location.travelToNextCity()
//location.travelToNextCity()
//location.travelToNextCity()
//location




/*:
 ---
 ### Question
 - on 과 off 값을 가진 enum 타입 RemoteControl 을 정의하고, 그 내부에 호출 시마다 on, off 값을 바꿔주는 함수 구현
 ---
 */
// 하단 Answer 참고

enum RemoteContorller {
    case on, off
    
    mutating func switchStatus() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var television = RemoteContorller.off
television.switchStatus()
television.switchStatus()
television.switchStatus()
television.switchStatus()
television.switchStatus()

/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

// enum Month { case jan, feb } 정의하되 2월은 윤년인지 아닌지 정보를 저장할 수 있도록 구현
enum Month2 {
  case jan, feb(Bool)
}

let february = Month2.feb(false)

switch february {
case .jan: break
case .feb(let isLeafYear): print(isLeafYear)
}





// 학점(A, B, C, D, F)을 enum 으로 표현하고 각 케이스에 알맞은 0.0 ~ 4.0 까지의 값 부여
enum Grade: Double {
  case A = 4.0, B = 3.0, C = 2.0, D = 1.0, F = 0.0
}

Grade.A
Grade.A.rawValue




// on 과 off 값을 가진 enum 타입 RemoteControl 을 정의하고, 그 내부에 호출 시마다 on, off 값을 바꿔주는 함수 구현
enum RemoteControl {
  case on, off
  
  mutating func toggle() {
    switch self {
    case .on:
      self = .off
    case .off:
      self = .on
    }
  }
}

var remoteControl = RemoteControl.on
remoteControl.toggle()
remoteControl.toggle()



//: [Next](@next)
