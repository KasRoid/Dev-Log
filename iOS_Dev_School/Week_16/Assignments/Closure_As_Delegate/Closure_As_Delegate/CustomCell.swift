//
//  CustomCell.swift
//  Closure_As_Delegate
//
//  Created by Doyoung Song on 7/20/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    
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
        setContraints()
    }
    
    private func setContraints() {
        
    }
    
    
    // MARK: - Methods
    func configureCell() {
        
    }
}
