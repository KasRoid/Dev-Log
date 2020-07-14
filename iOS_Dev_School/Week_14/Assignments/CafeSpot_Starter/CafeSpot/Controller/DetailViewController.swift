//
//  DetailViewController.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/10/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    }()
    
    var imageTitle: String = ""
    var imageSubtitle: String = ""
    var location: CafeList.Location?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        collectionView.register(DetailCollectionViewMapCell.self, forCellWithReuseIdentifier: DetailCollectionViewMapCell.identifier)
        collectionView.register(DetailCollectionViewSocialCell.self, forCellWithReuseIdentifier: DetailCollectionViewSocialCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.frame = view.frame
        collectionView.backgroundColor = .lightGray
    }
    
}


// MARK: - UICollectionViewDataSource
extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as? DetailCollectionViewCell else { fatalError() }
            cell.title.text = imageTitle
            cell.subtitle.text = imageSubtitle
            cell.backgroundColor = .systemBackground
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewMapCell.identifier, for: indexPath) as? DetailCollectionViewMapCell else { fatalError() }
            cell.latitude = location!.lat
            cell.longitude = location!.lng
            cell.backgroundColor = .systemBackground
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewSocialCell.identifier, for: indexPath) as? DetailCollectionViewSocialCell else { fatalError() }
            cell.backgroundColor = .systemBackground
            return cell
        default:
            fatalError("No CollectionView Cell Info")
        }
    }
    
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.item {
        case 0:
            return CGSize(width: view.frame.width, height: view.frame.height * 2 / 3)
        case 1:
            return CGSize(width: view.frame.width, height: view.frame.height * 1 / 2)
        case 2:
            return CGSize(width: view.frame.width, height: view.frame.height * 1 / 5)
        default:
            return CGSize(width: view.frame.width, height: view.frame.height * 2 / 3)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewCellLayout.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
