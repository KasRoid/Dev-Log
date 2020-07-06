//
//  TableViewCustomCell.swift
//  Test3Starter
//
//  Created by Doyoung Song on 7/3/20.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class TableViewCustomCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "TableViewCustomCell"
    var menuData: [[String: Any]]?
    
    let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCustomCell.self, forCellWithReuseIdentifier: CollectionViewCustomCell.identifier)
        return collectionView
    }()
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    private func configureUI() {
        backgroundColor = .white
        collectionView.backgroundColor = .white
        [titleImageView, collectionView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleImageView.topAnchor.constraint(equalTo: topAnchor),
            titleImageView.widthAnchor.constraint(equalToConstant: frame.width),
            titleImageView.heightAnchor.constraint(equalToConstant: 70),
            
            collectionView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    func loadCellData() {
        
        collectionView.reloadData()
    }
    
    private struct Standard {
        static let edgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        static let spacing: CGFloat = 12
    }
}

extension TableViewCustomCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let menu = menuData else { fatalError() }
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCustomCell.identifier, for: indexPath) as? CollectionViewCustomCell else { fatalError() }
        guard let menu = menuData, let title = menu[indexPath.item]["품명"] as? String, let price = menu[indexPath.item]["가격"] as? Int else { fatalError() }
        cell.menuImageView.image = UIImage(named: title)
        cell.nameLabel.text = title
        cell.priceLabel.text = String(price) + "원"
        return cell
    }
}

extension TableViewCustomCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Standard.edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Standard.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Standard.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = frame.width - Standard.edgeInsets.left - Standard.edgeInsets.right - Standard.spacing
        let height = frame.height - Standard.edgeInsets.top - Standard.edgeInsets.bottom - Standard.spacing
        return CGSize(width: width, height: height)
    }
}

extension TableViewCustomCell: UICollectionViewDelegate {
    
}

