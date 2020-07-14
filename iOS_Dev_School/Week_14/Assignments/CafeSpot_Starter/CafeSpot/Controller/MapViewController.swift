//
//  MapViewController.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/10/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    
    // MARK: - Properties
    private let mapView = MKMapView()
    private let detailView = DetailImageView()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(MapCollectionViewCell.self, forCellWithReuseIdentifier: MapCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    private lazy var toggleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("Toggle", for: .normal)
        button.addTarget(self, action: #selector(handleToggleButton(_:)), for: .touchUpInside)
        return button
    }()
    private var isOn = true
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        mapView.delegate = self
        mapView.frame = view.frame
        [mapView, detailView].forEach {
            view.addSubview($0)
        }
        detailView.clipsToBounds = true
        [toggleButton, collectionView].forEach {
            detailView.addSubview($0)
        }
        
        
        // Layout
        detailView.snp.makeConstraints({
            $0.top.equalTo((view.frame.height) / 1.7)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(3)
        })
        
        toggleButton.snp.makeConstraints({
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().dividedBy(9)
        })
        
        collectionView.snp.makeConstraints({
            $0.top.equalTo(toggleButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-10)
        })
    }
    
    
    // MARK: - Selectors
    @objc private func handleToggleButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            switch self.isOn {
            case true:
                self.detailView.snp.updateConstraints({
                    $0.top.equalTo((self.view.frame.height) / 1.15)
                })
                self.isOn = false
            case false:
                self.detailView.snp.updateConstraints({
                    $0.top.equalTo((self.view.frame.height) / 1.7)
                })
                self.isOn = true
            }
            self.view.layoutIfNeeded()
        })
    }
    
}


// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
}


// MARK: - UICollectionViewDataSource
extension MapViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.identifier, for: indexPath) as? MapCollectionViewCell else { fatalError() }
        cell.backgroundColor = .red
        return cell
    }
    
}


extension MapViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectionViewCellLayout.edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewCellLayout.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewCellLayout.spacing * 4
    }
    
}
