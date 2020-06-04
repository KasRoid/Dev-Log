//
//  ImageAnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 6. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ImageAnimationViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var repeatCountLabel: UILabel!
    
    let images = [
        "AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files"
        ].compactMap(UIImage.init(named:))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.animationImages = images
    }
    
    // MARK: - Action
    
    @IBAction private func startAnimation(_ sender: Any) {
        imageView.startAnimating()
    }
    
    @IBAction private func stopAnimation(_ sender: Any) {
        guard imageView.isAnimating else { return }
        imageView.stopAnimating()
    }
    
    @IBAction private func durationStepper(_ sender: UIStepper) {
        durationLabel.text = "\(sender.value)"
        
        // 기본값
        // 1 cycle ducation
        // defualt: 0.0 = 1/30 second
        imageView.animationDuration = sender.value
    }
    
    @IBAction private func repeatCountStepper(_ sender: UIStepper) {
        let repeatCount = Int(sender.value)
        repeatCountLabel.text = "\(repeatCount)"
        // 반복횟수
        // 기본값: 0 (무한반복)
        imageView.animationRepeatCount = repeatCount
    }
}











//    var arr: [UIImage] = []
//    for imageName in images {
//        if let image = UIImage(named: imageName) {
//            arr.append(image)
//        }
//    }
