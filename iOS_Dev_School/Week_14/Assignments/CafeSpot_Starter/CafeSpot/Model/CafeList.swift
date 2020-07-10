//
//  CafeList.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/10/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct CafeList: Decodable {
    
    var title: String
    var description: String
    var location: Location
    var isFavorite: Bool
    
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case location
        case isFavorite
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        location = try container.decode(Location.self, forKey: .location)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
    }
    
    struct Location: Decodable {
        var address: String
        var lat: Float
        var lng: Float
        
        private enum CodingKeys: String, CodingKey {
            case address
            case lat
            case lng
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            address = try container.decode(String.self, forKey: .address)
            lat = try container.decode(Float.self, forKey: .lat)
            lng = try container.decode(Float.self, forKey: .lng)
        }
    }
    
}
