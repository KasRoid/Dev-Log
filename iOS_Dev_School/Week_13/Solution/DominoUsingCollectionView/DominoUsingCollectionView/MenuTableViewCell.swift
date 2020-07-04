//
//  MenuTableViewCell.swift
//  DominoUsingCollectionView
//
//  Created by Lee on 2020/06/30.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
  static let identifier = "MenuTableViewCell"
  
  private let categoryImageView = UIImageView()
  private let menuCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  private var productData = [[String: Any]]()
  
  var offset: CGPoint {
    set { menuCollectionView.contentOffset = newValue }
    get { menuCollectionView.contentOffset }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(_ data: [String: Any]) {
    guard
      let imageName = data["카테고리"] as? String,
      let productData = data["메뉴"] as? [[String: Any]]
      else { return }
    
    categoryImageView.image = UIImage(named: imageName)
    
    self.productData = productData
    menuCollectionView.reloadData()
  }
}



// MARK: - UI

extension MenuTableViewCell {
  private func setUI() {
    categoryImageView.contentMode = .scaleToFill
    
    menuCollectionView.backgroundColor = .white
    menuCollectionView.dataSource = self
    menuCollectionView.delegate = self
    menuCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
  }
  
  private struct Standard {
    static let inset = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)
    static let lineSpace: CGFloat = 24
    static let visibleSpace: CGFloat = 8
  }
  
  private func setConstraint() {
    [categoryImageView, menuCollectionView].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      categoryImageView.heightAnchor.constraint(equalToConstant: 64),
      
      menuCollectionView.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor),
      menuCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      menuCollectionView.heightAnchor.constraint(equalToConstant: 440)
    ])
  }
}



// MARK: - UICollectionViewDataSourece

extension MenuTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    productData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else { fatalError() }
    
    cell.configure(productData[indexPath.item])
    
    return cell
  }
}



// MARK: - UICollecionViewDelegateFlowLayout

extension MenuTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    Standard.inset
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    Standard.lineSpace
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width - Standard.inset.left - Standard.inset.right - Standard.visibleSpace
    let height = collectionView.frame.height - Standard.inset.top - Standard.inset.bottom
    return CGSize(width: width, height: height)
  }
}
