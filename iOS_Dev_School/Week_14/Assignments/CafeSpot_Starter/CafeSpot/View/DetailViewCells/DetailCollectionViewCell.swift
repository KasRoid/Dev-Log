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
    
    private lazy var pageControl = UIPageControl(frame: CGRect(x: scrollView.frame.midX - 150, y: scrollView.frame.maxY - 200, width: 300, height: 40))
    var images = [UIImage]()
    
    var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    var subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        return label
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
        loadImages()
        configureScrollView()
        configurePageControl()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        [scrollView, pageControl, title, subtitle].forEach {
            addSubview($0)
        }
        scrollView.delegate = self
        scrollView.isPagingEnabled = true

        
        // Auto Layout
        scrollView.snp.makeConstraints({
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.8)
        })
        title.snp.makeConstraints({
            $0.top.equalTo(scrollView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.1)
        })
        subtitle.snp.makeConstraints({
            $0.top.equalTo(title.snp.bottom).inset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(10)
        })
    }
    
    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: self.frame.width * CGFloat(images.count), height: self.frame.height)
        
        for index in images.indices {
            scrollFrame.origin.x = scrollView.frame.width * CGFloat(index)
            scrollFrame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: scrollFrame)
            imageView.image = images[index]
            imageView.contentMode = .scaleAspectFill
            scrollView.addSubview(imageView)
        }
    }
    
    private func configurePageControl() {
        addSubview(pageControl)
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .darkText
        pageControl.addTarget(self, action: #selector(handlePageControl(_:)), for: .valueChanged)
    }
    
    
    // MARK: - Private Methods
    private func loadImages() {
        guard let imageName = title.text else { print("There is no text info"); return }
        let name = imageName + "0"
        let nextImage = name
        var i = 1
        
        while UIImage(named: nextImage + String(i)) != nil {
            images.append(UIImage(named: nextImage + String(i))!)
            i += 1
        }
    }
    
    
    // MARK: - Selectors
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
