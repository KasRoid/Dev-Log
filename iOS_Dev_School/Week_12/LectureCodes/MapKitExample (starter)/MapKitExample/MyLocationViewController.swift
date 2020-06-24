//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class MyLocationViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        checkAuthorizationStatus()
        mapView.showsUserLocation = true
    }
    
    
    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            startUpdatingLocation()
        @unknown default:
            fatalError()
        }
    }
    
    
    func startUpdatingLocation() {
        let status = CLLocationManager.authorizationStatus()
        guard status == .authorizedAlways || status == .authorizedWhenInUse else { return }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10.0
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func mornitoringHeading(_ sender: Any) {
        guard CLLocationManager.headingAvailable() else { return }
        locationManager.startUpdatingHeading()
    }
    
    @IBAction func stopMornitoring(_ sender: Any) {
        locationManager.stopUpdatingHeading()
    }
}


// MARK: - CLLocationManagerDelegate
extension MyLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Authorized")
        default:
            print("Unautorized")
        }
    }
    
    // 데이터를 받아오는 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let current = locations.last!
        
        // 몇 초 이내 얻은 데이터만 처리할 수 있도록...
//        if (abs(current.timestamp.timeIntervalSinceNow < 10)) {
//            let coordinate = current.coordinate
        
        let coordinate = current.coordinate // 내 현재 위치
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002) // span 단위가 1도, 경도 1도는 약 111km, 위도 1도는 경도에 따라 다름, 지도의 크기를 어느정도로 보여줄지 지저
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        addAnnotation(location: current)
    }
    
    // 유저의 위치를 따라가며 마크를 찍을 수 있는 함수
    func addAnnotation(location: CLLocation) {
        let annotation = MKPointAnnotation()
        annotation.title = "MyLocation"
        annotation.coordinate = location.coordinate
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
    }
}
