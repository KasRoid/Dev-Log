//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2020. 05. 26..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit


final class ItemCell: UITableViewCell {
    
    var btnCount = UIButton(type: .contactAdd)
    var countLabel = UILabel()
    
    let itemTitle = ["iPhone7", "iPhone8", "iPhoneSE_Gold", "iPhoneSE_RoseGold", "iPhoneX_SpaceGray", "iPhoneX_White", "iPhoneXs_SpaceGray", "iPhoneXs_White", "iPhoneSE2", "iPhone11_SpaceGray", "iPhone11_White", "iPhone11Pro_SpaceGray", "iPhone11Pro_White"]
    let itemsInStock = [
        "iPhone7": ["iPhone8", "10"],
        "iPhone8": ["iPhone8", "10"],
        "iPhoneSE_Gold": ["iPhoneSE_Gold", "8"],
        "iPhoneSE_RoseGold": ["iPhoneSE_RoseGold", "8"],
        "iPhoneX_SpaceGray": ["iPhoneX_SpaceGray", "5"],
        "iPhoneX_White": ["iPhoneX_White", "5"],
        "iPhoneXs_SpaceGray": ["iPhoneX_SpaceGray", "5"],
        "iPhoneXs_White": ["iPhoneX_White", "5"],
        "iPhoneSE2": ["iPhone8", "10"],
        "iPhone11_SpaceGray": ["iPhoneX_SpaceGray", "5"],
        "iPhone11_White": ["iPhoneX_White", "5"],
        "iPhone11Pro_SpaceGray": ["iPhoneX_SpaceGray", "5"],
        "iPhone11Pro_White": ["iPhoneX_White", "5"]
    ]
    var itemCount: Array<Int> = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if itemCount.count == 0 {
            print(itemCount.count)
            itemCount = []
            for _ in 1...itemTitle.count {
                itemCount.append(0)
            }
            print(itemCount)
        }
        
        btnCount.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        contentView.addSubview(btnCount)
        contentView.addSubview(countLabel)
        print(#function)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        btnCount.frame = CGRect(x: frame.width - 80, y: 15, width: 100, height: frame.height - 30)
        countLabel.frame = CGRect(x: frame.width - 90, y: 15, width: 100, height: frame.height - 30)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        itemCount[sender.tag] += 1
        countLabel.text = String(itemCount[sender.tag]) // 질문
        print(itemCount)
    }
}
