//
//  MapViewController.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/10/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import MapKit

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
    private var annotations = [MKPointAnnotation]()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setAnnotation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setRegion()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        mapView.frame = view.frame
        mapView.delegate = self
        [mapView, detailView].forEach {
            view.addSubview($0)
        }
        detailView.clipsToBounds = true
        [toggleButton, collectionView].forEach {
            detailView.addSubview($0)
        }
        
        // Setup Methods
        setConstraints()
    }
    
    private func setConstraints() {
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
    
    
    // MARK: - Private Methods
    private func setAnnotation() {
        for cafe in cafeBrain.cafeList {
            let annotation = MKPointAnnotation()
            let location = cafe.location
            let latitude = location.lat
            let longitude = location.lng
            
            annotation.title = cafe.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
            annotations.append(annotation)
            mapView.addAnnotation(annotation)
        }
    }
    
    private func setRegion() {
        let latitude = cafeBrain.cafeList[0].location.lat
        let longitude = cafeBrain.cafeList[0].location.lng
        let center = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func moveToAnnotation(annotation: MKPointAnnotation) {
        let center: CLLocationCoordinate2D = annotation.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
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
    // Clustering Annotation, 맵 로딩시 한번에 annotation 의 갯수만큼 호출되는 것 같다
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Cafe")
        annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "Cafe")
        annotationView?.clusteringIdentifier = "cluster"
        return annotationView
    }
}


// MARK: - UICollectionViewDataSource
extension MapViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cafeBrain.cafeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.identifier, for: indexPath) as? MapCollectionViewCell else { fatalError() }
        let title = cafeBrain.cafeList[indexPath.item].title
        let description = cafeBrain.cafeList[indexPath.item].description
        cell.imageView.image = UIImage(named: title)
        cell.title.text = title
        cell.subtitle.text = description
        return cell
    }
    
}


// MARK: - UICollectionViewDelegate
extension MapViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let annotation = annotations[indexPath.item]
        moveToAnnotation(annotation: annotation)
        mapView.selectAnnotation(annotation, animated: true)
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
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

