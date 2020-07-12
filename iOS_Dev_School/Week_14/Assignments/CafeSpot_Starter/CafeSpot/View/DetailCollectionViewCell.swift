//
//  DetailCollectionViewCell.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/10/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    static let identifier = "DetailCollectionViewCell"
    private lazy var scrollView = UIScrollView(frame: self.frame)
    private var scrollFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    private lazy var pageControl = UIPageControl(frame: CGRect(x: self.frame.midX - 150, y: self.frame.maxY - 70, width: 300, height: 40))
    var images = [UIImage]()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    private func configureUI() {
        [scrollView, pageControl].forEach {
            addSubview($0)
        }
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: self.frame.width * 4, height: self.frame.height)
        
        for index in images.indices {
            scrollFrame.origin.x = scrollView.frame.width * CGFloat(index)
            scrollFrame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: scrollFrame)
            scrollView.addSubview(imageView)
        }
        
        configurePageControl()
    }
    
    private func configurePageControl() {
        addSubview(pageControl)
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .darkText
        pageControl.addTarget(self, action: #selector(handlePageControl(_:)), for: .valueChanged)
    }
    
    @objc private func handlePageControl(_ sender: UIPageControl) {
        let x = CGFloat(sender.currentPage) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
}

extension DetailCollectionViewCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageNumber)
    }
}
