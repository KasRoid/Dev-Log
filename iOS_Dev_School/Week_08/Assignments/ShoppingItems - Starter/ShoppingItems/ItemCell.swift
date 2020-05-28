//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2020. 05. 26..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit


final class ItemCell: UITableViewCell {
    weak var delegate: ItemCellDelegate?
    
    var btnCount = UIButton(type: .contactAdd)
    var countLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        btnCount.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        contentView.addSubview(btnCount)
        contentView.addSubview(countLabel)
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
        self.delegate?.sendButtonTag(sender.tag)
    }
}

protocol ItemCellDelegate: class {
    func sendButtonTag(_ data: Int)
}
