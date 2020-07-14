//
//  ViewController.swift
//  ScrollView_Practice
//
//  Created by Doyoung Song on 7/12/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    var scrollFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    let colors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]
    lazy var pageControl = UIPageControl(frame: CGRect(x: view.frame.midX - 100, y: view.frame.maxY - 200, width: 200, height: 50))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        configurePageControl()
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: scrollView.frame.width * 4, height: scrollView.frame.height)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        
        for index in colors.indices {
            scrollFrame.origin.x = scrollView.frame.width * CGFloat(index)
            scrollFrame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: scrollFrame)
            imageView.backgroundColor = colors[index]
            scrollView.addSubview(imageView)
        }
    }
    
    private func configurePageControl() {
        view.addSubview(pageControl)
        pageControl.numberOfPages = colors.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.addTarget(self, action: #selector(handlePageControl(_:)), for: .valueChanged)
    }
    
    @objc private func handlePageControl(_ sender: UIPageControl) {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

