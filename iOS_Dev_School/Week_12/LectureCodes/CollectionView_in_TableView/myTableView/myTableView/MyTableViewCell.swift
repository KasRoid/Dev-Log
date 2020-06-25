//
//  MyTableViewCell.swift
//  myTableView
//
//  Created by Doyoung Song on 6/24/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "Cell"
    
    private var carList = [String]()
    
    var offset: CGPoint {
        set {
            collectionView.contentOffset = newValue
        }
        get {
            collectionView.contentOffset
        }
    }
    
    private let titleLabel = UILabel()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: [String: Any]) {
        titleLabel.text = data["브랜드"] as? String ?? "없음"
        carList = data["차종"] as? [String] ?? [String]()
        collectionView.reloadData()
    }
    
    private func setUI() {
        self.selectionStyle = .none
        
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .darkGray
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 40)
        
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    }
    
    private struct Standard {
        static let spcae: CGFloat = 8
        static let inset: UIEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    private func setConstraint() {
        [titleLabel, collectionView].forEach() {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }

}

extension MyTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        carList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.titleLabel.text = carList[indexPath.item]
        return cell
    }
}

extension MyTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        Standard.inset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Standard.spcae
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - Standard.inset.left - Standard.inset.right - Standard.spcae
        let height = collectionView.frame.height - Standard.inset.top - Standard.inset.bottom
        
        return CGSize(width: width, height: height)
    }
}
