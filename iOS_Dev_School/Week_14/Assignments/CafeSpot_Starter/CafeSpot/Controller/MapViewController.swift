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
    
    let mapView = MKMapView()
    let detailImageView = DetailImageView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        mapView.delegate = self
        mapView.frame = view.frame
        [mapView, detailImageView].forEach {
            view.addSubview($0)
        }
        
        // Layout
        detailImageView.snp.makeConstraints({
            $0.top.equalTo(view.snp.centerY).multipliedBy(1.3)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        })
    }
    
}


extension MapViewController: MKMapViewDelegate {
    
}
