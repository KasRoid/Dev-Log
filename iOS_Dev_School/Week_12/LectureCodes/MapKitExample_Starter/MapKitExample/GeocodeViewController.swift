//
//  GeocodeViewController.swift
//  MapKitExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit


final class GeocodeViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    
    @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {
        let touchPoint = gesture.location(in: gesture.view)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        reverseGeocode(loaction: location)
    }
    
    // 국가별 주소체계에 따라 어떤 속성 값을 가질지 다름
    func reverseGeocode(loaction: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(loaction) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let address = placeMark?.first,
                let country = address.country, let administrativeArea = address.administrativeArea, let locaity = address.locality, let name = address.name else { return }
            let addr = "\(country) \(administrativeArea) \(locaity) \(name)"
            print(addr)
            self.geocodeAddressString(addr)
        }
    }
    
    func geocodeAddressString(_ addressString: String) {
        print("위경도 -> 주소")
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
//            guard let place = placeMark?.first else { return }
//            print(place.location?.coordinate)
        }
    }
}
