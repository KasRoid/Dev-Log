//
//  CollectionViewCellLayout.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/10/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

var collectionViewCellLayout = CollectionViewCellLayout()

struct CollectionViewCellLayout {
    private let scene = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
    private lazy var width = scene.window!.frame.width
    private lazy var height = scene.window!.frame.height
    private let edges = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    private let space: CGFloat = 10
    
    lazy var edgeInsets: UIEdgeInsets = UIEdgeInsets(top: edges.top, left: edges.left, bottom: edges.bottom, right: edges.right)
    lazy var itemSize: CGSize = CGSize(width: (width / 2) - edges.left - edges.right, height: height / 3)
    lazy var spacing: CGFloat = space
}
