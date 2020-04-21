import UIKit

class Animal {
    var type = "mammalia"
    var arms: Int
    var legs = 0
    var speed = 0
    
    func walk() {
        let distance = speed * legs
        print("Speed: \(speed), Legs: \(legs)")
        print(distance)
    }
    
    init(arms: Int) {
        self.arms = arms
    }
}


class Person: Animal {
    override var legs: Int {
        get {
            return super.legs + 2
        }
        set {}
    }
    
    override var speed: Int {
        get {
            return super.speed + 5
        }
        set {}
    }
    
    func say(say: String) {
        print(say)
    }
    
    override func walk() {
        print("I'm waling...")
        super.walk()
    }
}

class Pet: Animal {
    override var legs: Int {
        get {
            return super.legs + 4
        }
        set {}
    }
    override var speed: Int {
        get {
            return super.speed + 5
        }
        set {}
    }
}

class Dog: Pet {
    override var speed: Int {
        get {
            super.speed + 5
        }
        set {}
    }
}

class Cat: Pet {
    override var speed: Int {
        get {
            super.speed + 3
        }
        set {}
    }
    override func walk() {
        print("Meyao")
        super.walk()
    }
}

var myPerson = Person(arms: 2)
myPerson.walk()

var myDog = Dog(arms: 0)
myDog.walk()

var myCat = Cat(arms: 0)
myCat.walk()
