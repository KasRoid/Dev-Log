//: [Previous](@previous)
//: # Versus Serialization
import Foundation

struct Dog: Codable {
  let name: String
  let age: Int
}

/*:
 ---
 ### Question
 - JSONSerialization을 이용해 Dog객체 생성
 - JSONDecoder를 이용해 Dog객체 생성
 ---
 */

/*
 Basic
 */
print("\n---------- [ Basic ] ----------\n")
let jsonData = """
  {
    "name": "Tory",
    "age": 3,
  }
  """.data(using: .utf8)!

// JSONSerialization
func fetchWithJsonSerialization() {
    guard let jsonObjects = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else { return }
    if let name = jsonObjects["name"] as? String,
        let age = jsonObjects["age"] as? Int {
        let dog = Dog(name: name, age: age)
        print(dog)
    }
}

fetchWithJsonSerialization()


// JSONDecoder
func fetchWithJsonDecoder() {
    let jsonDecoder = JSONDecoder()
    guard let decodedData = try? jsonDecoder.decode(Dog.self, from: jsonData) else { return }
    print(decodedData)
}

fetchWithJsonDecoder()



/*
 Array
 */
print("\n---------- [ Array ] ----------\n")
let jsonArrData = """
  [
    { "name": "Tory", "age": 3 },
    { "name": "Tory", "age": 3 },
  ]
  """.data(using: .utf8)!


// JSONSerialization
func fetchWithJsonSerialization2() {
    guard let jsonObjects = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] else { return }
    for object in jsonObjects {
        let name = object["name"]! as! String
        let age = object["age"]! as! Int
        let dog = Dog(name: name, age: age)
        print(dog)
    }
}

fetchWithJsonSerialization2()


// JSONDecoder
func fetchWithJsonDecoder2() {
    guard let decodedData = try? JSONDecoder().decode([Dog].self, from: jsonArrData) else { return }
    decodedData.forEach() { print($0) }
}

fetchWithJsonDecoder2()


/*
 Dictionary
 */
print("\n---------- [ Dictionary ] ----------\n")
let jsonDictData = """
{
  "data": [
    { "name": "Tory", "age": 3 },
    { "name": "Tory", "age": 3 },
  ]
}
""".data(using: .utf8)!

// JSONSerialization
func fetchWithJsonSerialization3() {
    guard let jsonObjects = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: Any] else { return }
    guard let data = jsonObjects["data"] as? [[String: Any]] else { return }
    for object in data {
        let name = object["name"]! as! String
        let age = object["age"]! as! Int
        let dog = Dog(name: name, age: age)
        print(dog)
    }
}
fetchWithJsonSerialization3()


// JSONDecoder
func fetchWithJsonDecoder3() {
    guard let decodedData = try? JSONDecoder().decode([String: [Dog]].self, from: jsonDictData) else { return }
    guard let dogs = decodedData["data"] else { return }
    dogs.forEach() { print($0) }
}
fetchWithJsonDecoder3()





/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

extension Dog {
  init?(from json: [String: Any]) {
    guard let name = json["name"] as? String,
      let age = json["age"] as? Int
      else { return nil }
    self.name = name
    self.age = age
  }
}

/*
 Basic
 */
print("---------- [ Basic ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
  if let dog = Dog(from: jsonObject) {
    print("Serialization :", dog)
  }
}

// JSONDecoder
if let dog = try? JSONDecoder().decode(Dog.self, from: jsonData) {
  print("Decoder :", dog)
}

/*
 Array
 */
print("\n---------- [ Array ] ----------")
// JSONSerialization
if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] {
  
  jsonObjects
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([Dog].self, from: jsonArrData) {
  dogs.forEach { print("Decoder :", $0) }
}


/*
 Dictionary
 */
print("\n---------- [ Dictionary ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: Any],
  let data = jsonObject["data"] as? [[String: Any]] {
  
  data
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([String: [Dog]].self, from: jsonDictData) {
  dogs.values.forEach { $0.forEach { print("Decoder :", $0) } }
}



//: [Table of Contents](@Contents) | [Previous](@previous) | [Next](@next)
