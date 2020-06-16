//
//  BasicViewController.swift
//  CollectionViewExercises
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

// [ 문제 ]
// edgeInset은 각각 8, 셀 간격과 줄 간격 = 4
// 아이템 크기는 한 줄에 4개가 나올 수 있도록 설정. 크기는 차이나도 무방

final class BasicViewController: UIViewController {
  
  let dataSource = cards
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}

// MARK: - UICollectionViewDataSource

extension BasicViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
}
