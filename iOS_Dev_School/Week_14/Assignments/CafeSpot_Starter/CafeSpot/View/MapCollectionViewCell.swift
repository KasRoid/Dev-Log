//
//  MapCollectionViewCell.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/12/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class MapCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "MapCollectionViewCell"
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        return imageView
    }()
    let title: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
    }()
    let subtitle: UILabel = {
        let label = UILabel()
        label.text = "subtitle"
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
        [imageView, title, subtitle].forEach {
            addSubview($0)
        }
        
        // Layout
        imageView.snp.makeConstraints({
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.7)
        })
        
        title.snp.makeConstraints({
            $0.top.equalTo(imageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.15)
        })
        
        subtitle.snp.makeConstraints({
            $0.top.equalTo(title.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.15)
        })
    }
    
}
