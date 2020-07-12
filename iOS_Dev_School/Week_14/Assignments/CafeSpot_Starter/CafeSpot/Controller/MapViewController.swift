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
    
    private let mapView = MKMapView()
    private let detailImageView = DetailImageView()
    
    private lazy var toggleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
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
        [mapView, detailImageView].forEach {
            view.addSubview($0)
        }
        detailImageView.clipsToBounds = true
        detailImageView.addSubview(toggleButton)
        
        // Layout
        detailImageView.snp.makeConstraints({
            $0.top.equalTo((view.frame.height) / 1.7)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(3)
        })
        
        toggleButton.snp.makeConstraints({
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().dividedBy(9)
        })
    }
    
    
    // MARK: - Selectors
    @objc private func handleToggleButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            switch self.isOn {
            case true:
                self.detailImageView.snp.updateConstraints({
                    $0.top.equalTo((self.view.frame.height) / 1.15)
                })
                self.isOn = false
            case false:
                self.detailImageView.snp.updateConstraints({
                    $0.top.equalTo((self.view.frame.height) / 1.7)
                })
                self.isOn = true
            }
            self.view.layoutIfNeeded()
        })
    }
    
}


extension MapViewController: MKMapViewDelegate {
    
}
