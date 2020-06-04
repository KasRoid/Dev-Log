//
//  ViewController.swift
//  ButtonAnimationExample
//
//  Created by giftbot on 2020/06/02.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  private struct Duration {
    static let short = 0.3
    static let middle = 0.65
    static let long = 1.0
  }
  
  private struct UI {
    static let menuCount = 5
    static let menuSize: CGFloat = 80
    static let distance: CGFloat = 130
    static let minScale: CGFloat = 0.3
  }
  
  private var firstMenuContainer: [UIButton] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupFirstMenu()
  }
  
  
  private func randomColorGenerator() -> UIColor {
    let r = CGFloat.random(in: 0...1.0)
    let g = CGFloat.random(in: 0...1.0)
    let b = CGFloat.random(in: 0...1.0)
    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
  }
  
  private func makeMenuButton(with frame: CGRect, title: String) -> UIButton {
    let button = UIButton(frame: frame)
    button.setTitle(title, for: .normal)
    button.backgroundColor = randomColorGenerator()
    button.layer.cornerRadius = button.bounds.width / 2
    button.transform = button.transform.scaledBy(x: UI.minScale, y: UI.minScale)
    view.addSubview(button)
    return button
  }
  
  private func setupFirstMenu() {
    for i in (0..<UI.menuCount) {
      let menuFrame = CGRect(
        x: 50, y: view.bounds.height - 120,
        width: UI.menuSize, height: UI.menuSize
      )
      let button = makeMenuButton(with: menuFrame, title: "버튼 \(i)")
      firstMenuContainer.append(button)
      
      if i == 0 {
        button.transform = .identity
        button.addTarget(self, action: #selector(firstMenuDidTap(_:)), for: .touchUpInside)
      }
    }
    // button 0 -> 1 -> 2 -> 3
    // button 1 -> 2 -> 3 -> 0
    view.bringSubviewToFront(firstMenuContainer.first!)
  }
  
  
  @objc func firstMenuDidTap(_ sender: UIButton) {
    sender.isSelected.toggle()
    // sender.isSelected == false
    
    UIView.animate(
      withDuration: Duration.long,  // 1.0
      delay: 0,
      usingSpringWithDamping: 0.8,
      initialSpringVelocity: 0.0,
      animations: {
        for (idx, menu) in self.firstMenuContainer.enumerated() {
          guard idx != 0 else { continue }
          
          if sender.isSelected {  // 메뉴 확장
            menu.transform = .identity
//            menu.center.y -= 130 * {1,2,3,4}
            menu.center.y -= UI.distance * CGFloat(idx)
            
          } else {  // 처음 상태로
            
            menu.transform = menu.transform.scaledBy(x: UI.minScale, y: UI.minScale)
            
//            menu.center.y += 130 * {1,2,3,4}
            menu.center.y += UI.distance * CGFloat(idx)
          }
        }
    })
  }
}
