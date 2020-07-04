//
//  CollectionViewCustomCell.swift
//  Test3Starter
//
//  Created by Doyoung Song on 7/3/20.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CollectionViewCustomCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "CollectionViewCustomCell"
    
    let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    private func configureUI() {
        backgroundColor = .white
        [menuImageView, nameLabel, priceLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            menuImageView.topAnchor.constraint(equalTo: topAnchor),
            menuImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            menuImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            menuImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            
            nameLabel.topAnchor.constraint(equalTo: menuImageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)
        ])
        
    }
    
    
    
}
