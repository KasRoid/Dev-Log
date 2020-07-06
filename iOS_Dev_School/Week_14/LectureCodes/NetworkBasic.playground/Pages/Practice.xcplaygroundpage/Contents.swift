//: [Previous](@previous)

import Foundation
import MapKit

/*
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 http://api.open-notify.org/iss-now.json
 */

func practice1() {
    let stringURL = "http://api.open-notify.org/iss-now.json"
    let url = URL(string: stringURL)!
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse else { return }
        (200..<400).contains(response.statusCode)
        guard let data = data else { return print("No Data") }
        
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                let location = jsonObject["iss_position"] as? [String: String] {
                let latitude = location["latitude"]!
                let longitude = location["longitude"]!
                
                let geoCoder = CLGeocoder()
                let address = CLLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
                geoCoder.reverseGeocodeLocation(address) { (placemarks, error) in
                    var placeMark: CLPlacemark!
                    placeMark =  placemarks?[0]
                    
                    if let locationName = placeMark.location {
                        print(locationName)
                    }
                    // Street address
                    if let street = placeMark.thoroughfare {
                        print(street)
                    }
                    // City
                    if let city = placeMark.subAdministrativeArea {
                        print(city)
                    }
                    // Zip code
                    if let zip = placeMark.isoCountryCode {
                        print(zip)
                    }
                    // Country
                    if let country = placeMark.country {
                        print(country)
                    }
                    if let something = placeMark.ocean {
                        print(something)
                    }
                }
            }
        } catch {
            print("Catch Error")
        }
    }
    dataTask.resume()
}
practice1()




/*
 [ 실습2 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 https://jsonplaceholder.typicode.com/posts
 */

struct Post {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

func practice2() {
    let stringURL = "https://jsonplaceholder.typicode.com/posts"
    guard let url = URL(string: stringURL) else { fatalError() }
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard error == nil else { fatalError("Error Occured") }
        guard let response = response as? HTTPURLResponse, (200..<400).contains(response.statusCode), response.mimeType == "application/json" else { fatalError("Response Error") }
        guard let data = data else { fatalError("No Data") }
        
        guard let jsonObjects = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] else { fatalError("No JSON Data") }
        var posts: [Post] = []
        for object in jsonObjects {
            if let userId = object["userId"] as? Int,
                let id = object["id"] as? Int,
                let title = object["title"] as? String,
                let body = object["body"] as? String {
                let post = Post(userId: userId, id: id, title: title, body: body)
                posts.append(post)
            }
        }
        
        print(posts.count)
    }
    dataTask.resume()
}

practice2()




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)


