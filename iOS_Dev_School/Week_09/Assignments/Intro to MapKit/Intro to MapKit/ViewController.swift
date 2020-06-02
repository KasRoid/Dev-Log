//
//  ViewController.swift
//  Intro to MapKit
//
//  Created by Kas Song on 2020.06.01.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit
import MapKit // MKMapView 를 사용하기 위한 framework
import CoreLocation


class ViewController: UIViewController {

    var mapView = MKMapView()
    let mapImageView = UIImageView()
    let mapLabel = UILabel()
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    var previousLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAutoLayout()
        checkLocationServices()

    }
    
    func setupUI() {
        mapView.delegate = self
        mapImageView.image = UIImage(named: "pin")
        mapImageView.contentMode = .scaleAspectFit
        mapLabel.textAlignment = .center
        mapLabel.backgroundColor = .white
    }
    
    func setupAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0).isActive = true
        
        view.addSubview(mapImageView)
        mapImageView.translatesAutoresizingMaskIntoConstraints = false
        mapImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        mapImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mapImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mapImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        
        view.addSubview(mapLabel)
        mapLabel.translatesAutoresizingMaskIntoConstraints = false
        mapLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mapLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mapLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mapLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0).isActive = true
        
    }
    
    // 유저의 위치를 파악하기 위한 기본값 세팅
    func setupLocationManager() {
        locationManager.delegate = self // UIContextMenuInteraction 에게 처리 위임
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 유저의 위치정보를 얼마나 정확히 파악할 것인지 설정
    }
    
    // 유저의 위치를 줌하여 표시
    func centerViewOnUserLocation() {
        // 현재 유저의 위치값을 location 으로 세팅
        if let location = locationManager.location?.coordinate {
            // 현재 유저의 위치값을 center 가 되도록 세팅하고, 얼마나 줌을 할지 설정
            let regoin = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(regoin, animated: true)
        }
    }
    
    // 앱 별 위치정보제공동의상황이 아닌 아이폰의 Global location 세팅을 체크한다.
    func checkLocationServices() {
        // 유저가 locationService 가 켜져있는 상태라면...
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }
        else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    // 유저가 선택한 위치정보제공동의 레벨을 확인
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse: // 앱이 실행되고 있을 경우에만 위치정보를 수집하도록 설정되었을 때
            startTrackingUserLocation()
            break
        case .denied:
            // show alert instructing them how to turn on permissions
            break
        case .notDetermined: // 아직 유저가 위치정보제공동의에 대한 결정을 하지 않은 경우
            locationManager.requestWhenInUseAuthorization()
        case .restricted: // 부모가 parentalControl 등으로 위치정보 제한을 걸었을 경우
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
            fatalError()
        }
    }
    
    func startTrackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }

}

extension ViewController: CLLocationManagerDelegate {
    
//    // 유저의 움직임을 확인하는 함수
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        // 현재 유저가 위치한 위도와 경도를 입력 받아 CLLocationCoordinate2D 타입으로 변수에 저장한다.
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        // 위에서 진행한 것과 같은 방식으로 줌 설정
//        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//        mapView.setRegion(region, animated: true) // 맵뷰의 위치를 유저의 위치가 중심이 되도록 세팅한다.
//    }
    
    // 유저의 위치정보제공동의 레벨을 적용하는 함수
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    func getDirection() {
        guard let location = locationManager.location?.coordinate else {
            // TODO: Inform user we don't have their current location.
            return
        }
        let request = createDirectionRequest(from: location)
        let directions = MKDirections(request: request)
        
        directions.calculate(){ [unowned self] (respose, error) in
            guard let response = respose else { return } // TODO: Show response not available in an alert
            for route in response.routes {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    func createDirectionRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        let destincationCoordinate      = getCenterLocation(for: mapView).coordinate
        let startingLocation            = MKPlacemark(coordinate: coordinate)
        let destination                 = MKPlacemark(coordinate: destincationCoordinate)
        
        let request                     = MKDirections.Request()
        request.source                  = MKMapItem(placemark: startingLocation)
        request.destination             = MKMapItem(placemark: destination)
        request.requestsAlternateRoutes = true
        
        return request
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder  = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else {
            return
        }
        
        guard center.distance(from: previousLocation) > 50 else {
            return
        }
        self.previousLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else {
                return
            }
            
            if let _ = error {
                // TODO: Show alert informing the user
            }
            
            guard let placemark = placemarks?.first else {
                // TODO: Show alert informing the user
                return
            }
            
            let streetNumber = placemark.thoroughfare ?? ""
            let streetName = placemark.thoroughfare ?? ""
            
            DispatchQueue.main.async {
                self.mapLabel.text = "\(streetNumber) \(streetName)"
            }
        }
    }
}
