//
//  ViewController.swift
//  AutoLayout_Example
//
//  Created by Kas Song on 2020.05.15.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    lazy var darkGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let defaultPaddding = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(orangeView)
        view.addSubview(darkGrayView)
        
        print(view.safeAreaInsets) // 여백
    }

    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewSafeAreaInsetsDidChange() {
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillLayoutSubviews() { // 상황에 따라 여러번 호출될 수 있음, 프레임이나 위치를 잡을 때만 사용해야함
        super.viewWillLayoutSubviews()
        let margin: CGFloat = 20
        let padding: CGFloat = 10
        let safeLayoutInsets = view.safeAreaInsets
        let horizontalInset = safeLayoutInsets.left + safeLayoutInsets.right
        let yOffset = safeLayoutInsets.top + margin
        let viewWidthValue = (view.frame.width - padding - horizontalInset) / 2 - margin
        
        let safteAreaTop = view.safeAreaInsets.top
        let safeAreaBottom = view.safeAreaInsets.bottom
        let safeAreaLeft = view.safeAreaInsets.left
        let safeAreaRight = view.safeAreaInsets.right
        let viewHeight = view.frame.height - (safteAreaTop + safeAreaBottom) - CGFloat(defaultPaddding) * 2
        let viewWidth = view.frame.width / 2 - (safeAreaLeft + safeAreaRight) - CGFloat(defaultPaddding) * 1.5
        
        orangeView.frame = CGRect(x: safeAreaLeft + 20, y: safteAreaTop + 20, width: viewWidth, height: viewHeight)
        darkGrayView.frame = CGRect(x: view.frame.width / 2 + 20, y: safteAreaTop + 20, width: viewWidth, height: viewHeight)
    }
    
    override func viewDidLayoutSubviews() {
    }

}
