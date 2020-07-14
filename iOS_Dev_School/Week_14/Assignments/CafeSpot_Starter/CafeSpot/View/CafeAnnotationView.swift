//
//  CafeAnnotationView.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/14/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import MapKit

class CafeAnnotationView: MKMarkerAnnotationView {
    
    static let preferredClusteringIdentifier = Bundle.main.bundleIdentifier! + ".CafeAnnotationView"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = CafeAnnotationView.preferredClusteringIdentifier
        collisionMode = .circle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var annotation: MKAnnotation? {
        willSet {
            clusteringIdentifier = CafeAnnotationView.preferredClusteringIdentifier
        }
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        guard let annotation = annotation as? MKClusterAnnotation else {
            return
        }
        
        let count = annotation.memberAnnotations.count
        image = self.image(annotation: annotation, count: count)
    }
    
    func image(annotation: MKClusterAnnotation, count: Int) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 40.0, height: 40.0))
        image = renderer.image { _ in
            UIColor.purple.setFill()
            UIBezierPath(ovalIn: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)).fill()
            let attributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)
            ]

            let text = "\(count)"
            let size = text.size(withAttributes: attributes)
            let rect = CGRect(x: 20 - size.width / 2, y: 20 - size.height / 2, width: size.width, height: size.height)
            text.draw(in: rect, withAttributes: attributes)
        }
        
        return image
    }
}
