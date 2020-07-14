//
//  DetailImageView.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/10/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class DetailImageView: UIView {
    
//    // MARK: - Properties
//    lazy var collectionView: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        return UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
//    }()
    
    
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


// MARK: - UICollectionViewDelegateFlowLayout
//extension DetailImageView: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let leftSpacing = collectionViewCellLayout.edgeInsets.left
//        let rightSpacing = collectionViewCellLayout.edgeInsets.right
//
//        switch indexPath.item {
//        case 0:
//            return CGSize(width: self.frame.width - leftSpacing - rightSpacing, height: self.frame.height * 2 / 3)
//        case 1:
//            return CGSize(width: self.frame.width - leftSpacing - rightSpacing, height: self.frame.height * 1 / 2)
//        case 2:
//            return CGSize(width: self.frame.width - leftSpacing - rightSpacing, height: self.frame.height * 1 / 5)
//        default:
//            return CGSize(width: self.frame.width - leftSpacing - rightSpacing, height: self.frame.height * 2 / 3)
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return collectionViewCellLayout.spacing
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//}
