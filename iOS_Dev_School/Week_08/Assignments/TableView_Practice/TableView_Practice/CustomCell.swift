//
//  CustomCell.swift
//  TableView_Practice
//
//  Created by Kas Song on 2020.05.26.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let addButton = UIButton(type: .contactAdd)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(addButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addButton.frame = CGRect(x: frame.width - 80, y: 15, width: 100, height: frame.height - 30)
    }
}
