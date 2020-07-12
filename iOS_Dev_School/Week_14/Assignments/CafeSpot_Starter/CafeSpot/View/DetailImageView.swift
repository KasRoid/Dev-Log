//
//  DetailImageView.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/10/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class DetailImageView: UIView {
    
    // MARK: - Properties
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        return collectionView
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
        self.backgroundColor = .gray
        self.layer.cornerRadius = 20
    }
    
}
