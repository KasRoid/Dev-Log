//: [Previous](@previous)

/*
 1. width, height 속성을 가진 Rectangle 클래스 정의
 2. 생성자(초기화 메서드)에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 변경할 수 있는 메서드 구현
 4. 사각형 가로와 세로의 길이를 반환하는 메서드 구현
 5. 사각형의 넓이를 반환하는 메서드 구현
 6. 다음과 같은 속성을 지닌 인스턴스 생성
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 */

class Rectangle {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func lengthChanger(width: Double, height: Double) -> () {
        self.width = width
        self.height = height
    }
    
    func lengthNotification() -> (Double, Double) {
        return (width, height)
    }
    
    func area() -> Double {
        return Double(width * height)
    }
}

let rectangle = Rectangle(width: 10, height: 5)
rectangle.area()
rectangle.lengthChanger(width: 5, height: 5)
rectangle.area()

let square = Rectangle(width: 7, height: 7)
square.area()
square.lengthNotification()
square.lengthChanger(width: 10, height: 10)
square.area()


/*
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
 2. TV 의 현재 채널 및 볼륨을 변경 가능한 메서드 구현
 3. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 구현
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
    (직접 프로퍼티에 값을 설정할 수 없다고 가정)
 5. 채널과 볼륨 정보를 확인했을 때 TV 전원이 꺼져있으면 -1 이 반환되도록 구현
 */

class TV {
    var channel: Int
    var volume: Int
    var power: Bool
    
    init(channelInfo: Int, volume: Int, power: Bool) {
        self.channel = channelInfo
        self.volume = volume
        self.power = power
    }
    
    func powerSwitch() -> () {
        switch power {
        case true:
            self.power = false
            print("The TV is OFF")
        default:
            self.power = true
            print("The TV is ON")
        }
    }
    
    func change(channel: Int, volume: Int) -> () {
        switch power {
        case true:
            self.channel = channel
            self.volume = volume
        default:
            print("The TV is turned off")
        }
    }
    
    func check() -> Int {
        switch power {
        case true:
            print("Channel: ", channel, ", Volume: ", volume)
            return 0
        default:
            return -1
        }
    }
}

let myTV = TV(channelInfo: 17, volume: 5, power: true)
myTV.change(channel: 10, volume: 7)
myTV.check()
myTV.powerSwitch()
myTV.check()
myTV.change(channel: 50, volume: 50)
myTV.powerSwitch()
myTV.check()


/*
 1. 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 2. 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 */

class Square {
    var length: Int
    var width: Int
    
    init(length: Int, width: Int) {
        self.length = length
        self.width = width
    }
    
    func round() -> Int {
        return length * 2 + width * 2
    }
    
    func area() -> Int {
        return length * width
    }
}


class Circle {
    var radius: Int
    
    init(radius: Int) {
        self.radius = radius
    }
    
    func round() -> Double {
        return Double(radius) * 3.14 * Double(2)
    }
    
    func area() -> Double {
        return Double(radius) * Double(radius) * 3.14
    }
}

var myCircle = Circle(radius: 8)
myCircle.round()
myCircle.area()
//: [Next](@next)
