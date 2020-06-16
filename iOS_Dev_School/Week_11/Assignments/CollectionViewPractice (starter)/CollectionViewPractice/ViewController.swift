//
//  ViewController.swift
//  CollectionViewPractice
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    lazy var images = ["cat0", "cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8", "cat9"].compactMap() { UIImage(named: $0) }
    lazy var originalImages = ["cat0", "cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8", "cat9"].compactMap() { UIImage(named: $0) }
    let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
    var selectedCellIndexPath: [IndexPath] = []
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        let lineSpacing: CGFloat = 20
        let edge: CGFloat = 8
        flowLayout.itemSize = CGSize(width: view.bounds.width / 2 - lineSpacing - (edge * 2), height: view.bounds.height / 4 - lineSpacing - (edge * 2))
        flowLayout.minimumLineSpacing = lineSpacing
        flowLayout.minimumInteritemSpacing = lineSpacing
        flowLayout.sectionInset = UIEdgeInsets(top: edge, left: edge, bottom: edge, right: edge)
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    // MARK: - Action
    private func ifAllCellsAreEmptyReloadOriginalImages() {
        guard images.isEmpty else { return }
        images = originalImages
    }
    
    private func resetCellsAttributes() {
        selectedCellIndexPath.sorted().reversed().forEach {
            guard let cell = collectionView.cellForItem(at: $0) as? CustomCell else { print("Guard Activated"); return }
            cell.cellIsSelected = false
            cell.mainImageView.alpha = 1
            cell.checkmarkImage.isHidden = true
        }
    }
    
    // MARK: - Selectors
    @IBAction func handleTrashBtn(_ sender: UIBarButtonItem) {
        resetCellsAttributes()
        selectedCellIndexPath.sorted().reversed().forEach { images.remove(at: $0.item) }
        collectionView.deleteItems(at: selectedCellIndexPath)
        selectedCellIndexPath.removeAll()
        ifAllCellsAreEmptyReloadOriginalImages()
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        cell.mainImageView.image = images[indexPath.item]
        return cell
    }
}


// MARK: - Protocols
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomCell {
            cell.userHasSelected()
            cell.cellIsSelected.toggle()
            if cell.cellIsSelected {
                selectedCellIndexPath.append(indexPath)
            }
            else {
                guard let item = selectedCellIndexPath.firstIndex(of: indexPath) else { return }
                selectedCellIndexPath.remove(at: item)
            }
        }
    }
}
