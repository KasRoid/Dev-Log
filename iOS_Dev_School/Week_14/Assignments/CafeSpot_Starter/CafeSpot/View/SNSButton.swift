//
//  SNSButton.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/13/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class SNSButton: UIButton {
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let title = UILabel()
    
    
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
        setAttributes()
        setConstraints()
    }
    
    private func setAttributes() {
        layer.borderWidth = 1.0
        backgroundColor = .systemBackground
    }
    
    private func setConstraints() {
        [icon, title].forEach {
            addSubview($0)
        }
        
        icon.snp.makeConstraints({
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.3)
        })
        
        title.snp.makeConstraints({
            $0.top.trailing.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(icon.snp.trailing)
        })
    }
}
