//
//  Products.swift
//  Dominos11_Starter
//
//  Created by Kas Song on 2020.05.29.
//  Copyright © 2020 Kira. All rights reserved.
//

import Foundation

var products = Products()

struct Products {
    var productsTitle = ["슈퍼시드", "프리미엄", "클래식",  "사이드디시", "피클소스", "음료"]
    var productsDetail = [
        "슈퍼시드": ["글램핑 바비큐", "알로하 하와이안", "우리 고구마", "콰트로 치즈 퐁듀"],
        "클래식": ["베이컨체더치즈", "불고기", "슈퍼디럭스", "슈퍼슈프림", "페퍼로니"],
        "프리미엄": ["더블크러스트 이베리코", "블랙앵거스 스테이크", "블랙타이거 슈림프", "와규 앤 비스테카", "직화 스테이크"],
        "사이드디시": ["딸기 슈크림", "슈퍼곡물 치킨", "애플 크러스트 디저트", "퀴노아 치킨 샐러드", "포테이토 순살치킨"],
        "피클소스": ["갈릭 디핑 소스", "스위트 칠리소스", "우리 피클 L", "우리 피클 M", "핫소스"],
        "음료": ["미닛메이드 스파클링 청포도", "스프라이트", "코카콜라 제로", "코카콜라"]
    ]
    
    var productsOnCart: Dictionary<String, Dictionary<String, Int>> = ["": ["": 0] ] // 카테코리: [아이템: 수량]
    var itemOnCart: [String] = [] // 주문 아이템 목록
    var receipt: [String: Int] = [:] // 아이템별 주문수량
    var priceOfEachItem: [String: Int] = [:]
    var needToReset = false
    
    mutating func addItemOnCart(_ item: String) {
        if !itemOnCart.contains(item) {
            itemOnCart.append(item)
            receipt[item] = 1
        }
        else {
            var itemCount = 0
            guard let value = receipt[item] else {
                print("addItemOnCart func: Guard Activated")
                return
            }
            itemCount = value
            itemCount += 1
            receipt[item] = itemCount
        }
    }
    
    mutating func removeItemOnCart(_ item: String) {
        if receipt[item]! > 0 {
            receipt[item]! -= 1
        }
        if receipt[item] == 0 {
            if let i = itemOnCart.firstIndex(of: item) {
                itemOnCart.remove(at: i)
            }
            
        }
    }
    
    func countingProductsOnCart() -> Int {
        let counter = itemOnCart.count
        return counter
    }
    
    mutating func reset() {
        itemOnCart.removeAll()
        receipt.removeAll()
        productsOnCart.removeAll()
        needToReset = true
    }
    
    mutating func setPriceOfEachItem() {
        for items in productsDetail["슈퍼시드"]! {
            priceOfEachItem[items] = 20000
        }
        for items in productsDetail["프리미엄"]! {
            priceOfEachItem[items] = 17500
        }
        for items in productsDetail["클래식"]! {
            priceOfEachItem[items] = 15000
        }
        for items in productsDetail["사이드디시"]! {
            priceOfEachItem[items] = 7000
        }
        for items in productsDetail["피클소스"]! {
            priceOfEachItem[items] = 500
        }
        for items in productsDetail["음료"]! {
            priceOfEachItem[items] = 2000
        }
    }
    
    func totalPayment() -> String {
        var text = ""
        var totalPrice = 0
        for title in receipt.keys {
            guard let number = receipt[title] else {
                print("totalPayment func: guard activated")
                return "Error"
            }
            text += (title + ": " + String(number) + "개")
            text += "\n"
            totalPrice += priceOfEachItem[title]! * number
        }
        if text != "" {
            text += "결제금액: " + String(totalPrice) + "원"
        }
        return text
    }
}
