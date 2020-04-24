//
//  ViewController.swift
//  ViewFrame
//
//  Created by Giftbot on 2020/04/24.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let colors: [UIColor] = [.blue, .red, .green]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 1) 루트뷰에 모두 올리는 방식
    addSubviewOnRootView()
    
    // 2) 배경 뷰 위에 올리는 방식
    //    addSubviewOnBackgroundView()
  }
  
  
  func addSubviewOnRootView() {
    var frame = view.frame
    
    for color in colors {
      let colorView = createSubview(frame: frame, color: color)
      view.addSubview(colorView)
      frame = colorView.frame
      print(colorView.frame)
    }
  }
  
  func addSubviewOnBackgroundView() {
    var superView: UIView = view
    
    for color in colors {
      let colorView = createSubview(size: superView.frame.size, color: color)
      superView.addSubview(colorView)
      superView = colorView
      print(colorView.frame)
    }
  }
  
  
  func decreaseRectFrame(from frame: CGRect) -> CGRect {
    CGRect(x: frame.minX + 30,
           y: frame.minY + 30,
           width: frame.width - 60,
           height: frame.height - 60)
  }
  
  func createSubview(frame: CGRect, color: UIColor) -> UIView {
    let view = UIView(frame: decreaseRectFrame(from: frame))
    view.backgroundColor = color
    return view
  }
  
  func createSubview(size: CGSize, color: UIColor) -> UIView {
    createSubview(frame: CGRect(origin: .zero, size: size), color: color)
  }
}
