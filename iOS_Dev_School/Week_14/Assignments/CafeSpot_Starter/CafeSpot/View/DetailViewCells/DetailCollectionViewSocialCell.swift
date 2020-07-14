//
//  MapCollectionViewSocailCell.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/13/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class DetailCollectionViewSocialCell: UICollectionViewCell {
    
    static let identifier = "DetailCollectionViewSocialCell"
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "추가 정보"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private let instagramBtn = SNSButton()
    private let navermapBtn = SNSButton()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        setButtons()
        setConstraints()
    }
    
    private func setButtons() {
        // Set button attributes
        instagramBtn.icon.image = UIImage(named: "instagram")!
        instagramBtn.title.text = "인스타그램 확인"
        
        navermapBtn.icon.image = UIImage(named: "navermap")!
        navermapBtn.title.text = "네이버맵 길 찾기"
        
        // Add Views
        [instagramBtn, navermapBtn].forEach {
            $0.addTarget(self, action: #selector(handleSNSButtons(_:)), for: .touchUpInside)
            stackView.addArrangedSubview($0)
            $0.snp.makeConstraints({
                $0.height.equalToSuperview().multipliedBy(0.5)
            })
        }
    }
    
    private func setConstraints() {
        [title, stackView].forEach {
            addSubview($0)
        }
        
        // Auto Layout
        title.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.4)
        })
        
        stackView.snp.makeConstraints({
            $0.top.equalTo(title.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
        })
    }
    
    
    // MARK: - Private Methods
    private func handleInstagram() {
        let instagram = URL(string: "instagram://app")!

        if UIApplication.shared.canOpenURL(instagram) {
                UIApplication.shared.open(instagram, options: [:], completionHandler: nil)
            } else {
                print("Instagram not installed")
        }
    }
    
    private func handleNaverMap() {
        let url = URL(string: "nmap://actionPath?parameter=value&appname=CafeSpot")!
        let appStoreURL = URL(string: "http://itunes.apple.com/app/id311867728?mt=8")!

        if UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url)
        } else {
          UIApplication.shared.open(appStoreURL)
        }
    }
    
    
    // MARK: - Selectors
    @objc private func handleSNSButtons(_ sender: SNSButton) {
        switch sender {
        case instagramBtn:
            handleInstagram()
        case navermapBtn:
            handleNaverMap()
        default:
            break
        }
    }
}
