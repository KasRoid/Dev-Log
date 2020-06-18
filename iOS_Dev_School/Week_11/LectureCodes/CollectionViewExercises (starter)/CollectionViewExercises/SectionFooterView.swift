//
//  SectionFooterView.swift
//  CollectionViewExercises
//
//  Created by Doyoung Song on 6/18/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class SectionFooterView: UICollectionReusableView {
    static let identifier = "SectionFooterView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
