//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class GestureViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.width / 2
            imageView.clipsToBounds = true
        }
    }
    
    var tapped = false
    
    @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else { return }
        if tapped {
            tapped = false
            imageView.transform = .identity
        }
        else {
            tapped = true
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        }
    }
    
    @IBAction private func handleRoationGesture(_ sender: UIRotationGestureRecognizer) {
        guard sender.state == .began || sender.state == .changed else { return }
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    @IBAction private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        guard sender.state == .ended else { return }
        if sender.direction == .right {
            print("right")
            imageView.image = UIImage(named: "cat1")
        }
        else if sender.direction == .left {
            print("left")
            imageView.image = UIImage(named: "cat2")
        }
    }
    
}
