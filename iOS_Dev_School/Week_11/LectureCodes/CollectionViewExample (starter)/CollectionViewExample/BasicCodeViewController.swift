//
//  BasicCodeViewController.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class BasicCodeViewController: UIViewController {
  
  let itemCount = 100
  var collectionView: UICollectionView!
  var controllerStackView: UIStackView!
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSliders()
    setupCollectionView()
    setupNavigationItem()
  }

  // MARK: Setup Views
  
  func setupSliders() {
  }
  
  func setupCollectionView() {
    
  }
  
  func setupNavigationItem() {
  }
  
  
  // MARK: Action
  
  @objc private func changeCollectionViewDirection(_ sender: Any) {
  }
}


// MARK: - UICollectionViewDataSource

extension BasicCodeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
}
