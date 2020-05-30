//
//  CustomCell.swift
//  Dominos11_Starter
//
//  Created by Kas Song on 2020.05.29.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    var titleImageView = UIImageView()
    var indexPathFromCategoryViewController: IndexPath = IndexPath(row: 0, section: 0)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleImageView.frame = contentView.frame
        titleImageView.contentMode = .scaleToFill
        titleImageView.backgroundColor = .white
        titleImageView.image = UIImage(named: products.productsTitle[indexPathFromCategoryViewController.row])
        contentView.addSubview(titleImageView)
    }
}

extension CustomCell: CategroyViewDelegate {
    func sendIndexPath(_ data: IndexPath) {
        indexPathFromCategoryViewController = data
    }
}
