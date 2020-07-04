//
//  ProductCollectionViewCell.swift
//  DominoUsingCollectionView
//
//  Created by Lee on 2020/06/30.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
  static let identifier = "ProductCollectionViewCell"
  
  private let imageView = UIImageView()
  private let nameLabel = UILabel()
  private let priceLabel = UILabel()
  private let plusButton = UIButton()
  private let countLabel = UILabel()
  private let minusButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(_ data: [String: Any]) {
    guard
      let name = data["품명"] as? String,
      let price = data["가격"] as? Int
      else { return }
    
    imageView.image = UIImage(named: name)
    nameLabel.text = name
    priceLabel.text = String(price) + "원"
  }
}



// MARK: - UI

extension ProductCollectionViewCell {
  private func setUI() {
    contentView.backgroundColor = .gray
    
    imageView.contentMode = .scaleAspectFit
    
    nameLabel.font = .boldSystemFont(ofSize: 24)
    
    priceLabel.font = .boldSystemFont(ofSize: 20)
    
    [nameLabel, priceLabel].forEach {
      $0.textColor = .white
      $0.textAlignment = .center
    }
  }
  
  private func setConstraint() {
    [imageView, nameLabel, priceLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    [nameLabel, priceLabel].forEach {
      $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
      
      nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
      
      priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
      priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      priceLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
    ])
  }
}
