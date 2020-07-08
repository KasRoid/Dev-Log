//: [Previous](@previous)
import Foundation

let decoder = JSONDecoder()

/*
 1번 문제
 - 다음 JSON 내용을 Fruit 타입으로 변환
 */
print("\n---------- [ 1번 문제 (Fruits) ] ----------\n")
let jsonFruits = """
[
{
  "name": "Orange",
  "cost": 100,
  "description": "A juicy orange"
},
{
  "name": "Apple",
  "cost": 200
},
{
  "name": "Watermelon",
  "cost": 300
},
]
""".data(using: .utf8)!


struct Fruit: Codable {
    var name: String
    var cost: Int
    var description: String?
}

func decodeJsonFruits() {
    guard let decodedData = try? JSONDecoder().decode([Fruit].self, from: jsonFruits) else { return }
    decodedData.forEach() { print($0) }
}
decodeJsonFruits()


/*
 2번 문제
 - 다음 JSON 내용을 Report 타입으로 변환
 */
print("\n---------- [ 2번 문제 (Report) ] ----------\n")
let jsonReport = """
{
  "name": "Final Results for iOS",
  "report_id": "905",
  "read_count": "10",
  "report_date": "2019-02-14",
}
""".data(using: .utf8)!

struct Report: Decodable {
    var name: String
    var reportId: String
    var readCount: String
    var reportDate: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case reportId = "report_id"
        case readCount = "read_count"
        case reportDate = "report_date"
    }
}

func decodeJsonReport() {
    guard let decodedData = try? JSONDecoder().decode(Report.self, from: jsonReport) else { return }
    print(decodedData)
}
decodeJsonReport()

/*
 3번 문제
 - Nested Codable 내용을 참고하여 다음 JSON 내용을 파싱
 */

print("\n---------- [ 3번 문제 (Movie) ] ----------\n")
let jsonMovie = """
[
  {
    "name": "Edward",
    "favorite_movies": [
      { "title": "Gran Torino", "release_year": 2008 },
      { "title": "3 Idiots", "release_year": 2009 },
      { "title": "Big Fish", "release_year": 2003 },
    ]
  }
]
""".data(using: .utf8)!

struct Person: Decodable {
    
    var name: String
    var favoriteMovies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case favoriteMovies = "favorite_movies"
    }

    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        name = try keyedContainer.decode(String.self, forKey: .name)
        favoriteMovies = try keyedContainer.decode([Movie].self, forKey: .favoriteMovies)
    }
    
    struct Movie: Decodable {
        var title: String
        var releaseYear: Int
    
        private enum CodingKeys: String, CodingKey {
            case title
            case releaseYear = "release_year"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decode(String.self, forKey: .title)
            releaseYear = try container.decode(Int.self, forKey: .releaseYear)
        }
    }
}


func decodeJsonMovie() {
    do {
        let decodedData = try JSONDecoder().decode([Person].self, from: jsonMovie)
        decodedData.forEach() { print($0.favoriteMovies) }
    } catch let error {
        print(error.localizedDescription)
    }
    
}

decodeJsonMovie()



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
