//
//  HomeCollectionViewCell.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/10/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "UICollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        return label
    }()

    let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
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
    
    
    // MARK: - Private Methods
    private func configureUI() {
        [imageView, titleLabel, detailLabel].forEach {
            addSubview($0)
        }
        
        imageView.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.7)
            $0.centerX.equalToSuperview()
        })
        
        titleLabel.snp.makeConstraints({
            $0.top.equalTo(imageView.snp.bottom)
            $0.height.equalToSuperview().multipliedBy(0.15)
            $0.centerX.equalToSuperview()
        })
        
        detailLabel.snp.makeConstraints({
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.height.equalToSuperview().multipliedBy(0.15)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        })
    }
    
}
