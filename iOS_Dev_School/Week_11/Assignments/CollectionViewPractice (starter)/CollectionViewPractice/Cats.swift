//
//  Cats.swift
//  CollectionViewPractice
//
//  Created by Doyoung Song on 6/18/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

struct Cats {
    let images = ["cat0", "cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8", "cat9"].compactMap() { UIImage(named: $0) }
}
