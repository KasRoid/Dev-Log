//
//  CustomCell.swift
//  CollectionViewPractice
//
//  Created by Doyoung Song on 6/16/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "CustomCell"
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let checkmarkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = .darkText
        imageView.isHidden = true
        return imageView
    }()
    override var isSelected: Bool {
        didSet {
            mainImageView.alpha = isSelected ? 0.4 : 1
            checkmarkImage.isHidden = isSelected ? false : true
        }
    }
    
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
        [mainImageView, checkmarkImage].forEach() {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints.toggle()
        }
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            checkmarkImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            checkmarkImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            checkmarkImage.heightAnchor.constraint(equalToConstant: 40),
            checkmarkImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
