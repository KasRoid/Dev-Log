//
//  CafeBrain.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/10/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

var cafeBrain = CafeBrain()

struct CafeBrain {
    
    
    // MARK: - Properties
    var cafeList: Array<CafeList> = []
    
    private let filePath = Bundle.main.path(forResource: "CafeList", ofType: "json")
    
    
    // MARK: - Methods
    mutating func parsingCafeData() {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath!))
            do {
                let decodedData = try JSONDecoder().decode([CafeList].self, from: data)
                cafeList.append(contentsOf: decodedData)
            } catch let error {
                print("Decode:", error, error.localizedDescription)
            }
        } catch let error {
            print("Data:", error.localizedDescription)
        }
    }
}
