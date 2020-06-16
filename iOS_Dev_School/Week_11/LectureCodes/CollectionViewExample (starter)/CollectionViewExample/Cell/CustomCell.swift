//
//  CustomCell.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class CustomCell: UICollectionViewCell {
  static let identifier = "CustomCell"
  
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  
  // MARK: Init
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  // MARK: Setup
  
  private func setupViews() {
    
  }
  
  
  private func setupConstraints() {
    [imageView, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      
      titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      titleLabel.heightAnchor.constraint(equalToConstant: 25)
    ])
  }
  
  // MARK: Configure Cell
  
}
