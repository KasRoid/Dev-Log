//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.bounds.width / 2
            imageView.clipsToBounds = true
        }
    }
    
    var isHoldingImage = false
    var lastTouchPoint = CGPoint.zero
    
    
    // MARK: - Touch Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        
        // 이미지뷰의 원점 + 크기
        if imageView.frame.contains(touchPoint) {
            imageView.image = UIImage(named: "cat2")
            isHoldingImage = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard isHoldingImage, let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
//        if imageView.frame.contains(touchPoint) {
//            UIView.animate(
//                withDuration: 0.1,
//                animations: {
//                    self.imageView.center = touchPoint
//                    self.view.layoutIfNeeded()
//            })
//        }
        
        let prevTouchPoint = touch.previousLocation(in: touch.view)
        imageView.center.x = imageView.center.x + (touchPoint.x - prevTouchPoint.x)
        imageView.center.y = imageView.center.y + (touchPoint.y - prevTouchPoint.y)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else { return }
        imageView.image = UIImage(named: "cat1")
        isHoldingImage = false
    }
    
    // system interruption, inactive 상태, 터치 중인 뷰가 제거될 때
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        guard let touch = touches.first else { return }
        isHoldingImage = false
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionBegan(motion, with: event)
        if motion == .motionShake {
            imageView.image = UIImage(named: "cat2")
        }
    }
}
