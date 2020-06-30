//
//  ReorderingViewController.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class ReorderingViewController: UIViewController {
    
    let _images = ParkManager.imageNames(of: .nationalPark)
    lazy var parkImages = Array(repeating: _images, count: 5).flatMap { $0 }
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        cv.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        cv.backgroundColor = .white
        cv.dataSource = self
        view.addSubview(cv)
        return cv
    }()
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFlowLayout()
        setupLongPressGestureRecognizer()
    }
    
    
    // MARK: Setup FlowLayout
    func setupFlowLayout() {
        let itemsInLine: CGFloat = 4
        let spacing: CGFloat = 10.0
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cvWidth = collectionView.bounds.width
        let contentSize = cvWidth - insets.left - insets.right - (spacing * (itemsInLine - 1))
        let itemsSize = (contentSize / itemsInLine).rounded(.down) // 소수점에 의해 레이아웃이 달라지는 경우가 있어 소수점을 버려주는 작업을 진행한다.
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = insets
        layout.itemSize = CGSize(width: itemsSize, height: itemsSize)
    }
    
    
    // MARK: Setup Gesture
    func setupLongPressGestureRecognizer() {
        let gesture = UILongPressGestureRecognizer(
        target: self,
        action: #selector(reorderCollectionViewItem(_:))
        )
        collectionView.addGestureRecognizer(gesture)
    }
    

    // MARK: - Action
    @objc private func reorderCollectionViewItem(_ sender: UILongPressGestureRecognizer) {
        let location = sender.location(in: collectionView)
        switch sender.state {
        case .began: // 아이템을 최초 눌렀을 때 한번 발동된다.
            guard let indexPath = collectionView.indexPathForItem(at: location) else { break }
            collectionView.beginInteractiveMovementForItem(at: indexPath)
//            애니메이션 작동을 해제하고 싶을 경우 어떤 뷰에서도 사용할 수 있다.
//            UIView.setAnimationsEnabled(false)
        case .changed: // 아이템을 잡고 옮길 때 발동된다.
            collectionView.updateInteractiveMovementTargetPosition(location)
        case .cancelled: // 전화와 같이 방해를 받았을 때 발동되는 것 같다.
            collectionView.cancelInteractiveMovement()
        case .ended: // 아이템을 내려놓게되면 발동된다.
            collectionView.endInteractiveMovement()
        default:
            break
        }
    }
}


// MARK: - UICollectionViewDataSource
extension ReorderingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parkImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCell.identifier, for: indexPath
            ) as! CustomCell
        
        let item = indexPath.item
        cell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item])
        cell.backgroundColor = .black
        return cell
    }
    
    // 컬렉션 뷰의 각 아이템 이동을 도와주는 함수
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard sourceIndexPath != destinationIndexPath else { return }
        let source = sourceIndexPath.item
        let destination = destinationIndexPath.item
        print("source: ", source, "dest: ", destination)
        
        let element = parkImages.remove(at: source)
        parkImages.insert(element, at: destination)
    }
}

