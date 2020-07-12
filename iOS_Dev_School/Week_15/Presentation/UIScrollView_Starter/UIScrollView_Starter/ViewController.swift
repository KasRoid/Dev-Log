//
//  ViewController.swift
//  UIScrollView_Starter
//
//  Created by Doyoung Song on 7/13/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    lazy var scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    var scrollFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    let colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]
    lazy var pageControl = UIPageControl(frame: CGRect(x: view.frame.midX - 100, y: view.frame.maxY - 200, width: 200, height: 50))

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureScrollView()
        configurePageControl()
    }

    
    // MARK: - UI
    private func configureScrollView() {
        
    }
    
    private func configurePageControl() {
        
    }
    
    
    
    // MARK: - Selectors
    @objc private func handlePageControl(_ sender: UIPageControl) {
        
    }
    
}

