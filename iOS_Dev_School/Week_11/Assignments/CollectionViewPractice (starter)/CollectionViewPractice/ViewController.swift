//
//  ViewController.swift
//  CollectionViewPractice
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    let cats = Cats()
    @IBOutlet weak var deleteImagesButton: UIBarButtonItem!
    lazy var images = [].compactMap() { UIImage(named: $0) }
    let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
    var selectedCellIndexPath: [IndexPath] = []
    lazy var setNumberOfImagesButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handleSetImages(_:)))
    var numberOfImages = 20
    var numberOfImagesInEachLine: CGFloat = 2
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        let spaceBetweenItems: CGFloat = 8
        let edge: CGFloat = 8
        let horizontalSpacing = ((spaceBetweenItems * (numberOfImagesInEachLine - 1)) + (edge * 2)) / 2
        let width = view.bounds.width / numberOfImagesInEachLine - horizontalSpacing
        flowLayout.itemSize = CGSize(width: width, height: width)
        flowLayout.minimumLineSpacing = spaceBetweenItems
        flowLayout.minimumInteritemSpacing = spaceBetweenItems
        flowLayout.sectionInset = UIEdgeInsets(top: edge, left: edge, bottom: edge, right: edge)
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationItem.rightBarButtonItems = [deleteImagesButton, setNumberOfImagesButton]
        createImagesInArray()
    }
    
    
    // MARK: - Action
    private func ifAllCellsAreEmptyReloadOriginalImages() {
        guard images.isEmpty else { return }
        createImagesInArray()
    }
    
    private func createImagesInArray() {
        while images.count < numberOfImages {
            images.append(cats.images[images.count % cats.images.count])
        }
    }
    
    
    // MARK: - Selectors
    @IBAction func handleTrashBtn(_ sender: UIBarButtonItem) {
        selectedCellIndexPath.sorted().reversed().forEach { images.remove(at: $0.item) }
        collectionView.deleteItems(at: selectedCellIndexPath)
        selectedCellIndexPath.removeAll()
        ifAllCellsAreEmptyReloadOriginalImages()
        collectionView.reloadData()
    }
    
    @objc func handleSetImages(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "아이템 갯수 선택", message: "한 라인에 표시될 이미지의 갯수를 선택하세요", preferredStyle: .alert)
        alert.addTextField()
        alert.textFields![0].keyboardType = .numberPad
        alert.addAction(UIAlertAction(
            title: "확인",
            style: .cancel,
            handler: { _ in
                if let textField = alert.textFields?.first {
                    guard let value = textField.text, let intValue = Int(value) else { return }
                    self.numberOfImagesInEachLine = CGFloat(intValue)
                    self.selectedCellIndexPath.removeAll()
                    self.images.removeAll()
                    self.createImagesInArray()
                    self.configureUI()
                    self.collectionView.reloadData()
                }
        }))
        present(alert, animated: true)
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
        selectedCellIndexPath.append(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let item = selectedCellIndexPath.firstIndex(of: indexPath) else { return }
        selectedCellIndexPath.remove(at: item)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        return true
    }
}
