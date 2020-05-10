//
//  ViewController.swift
//  ContainerViewController
//
//  Created by Kas Song on 2020.05.08.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushViewController(_:)))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FirstVC"
        navigationItem.title = "FirstVC2"
        
        // iOS 11 이상, sceneDelegate 에서 설정하는 경우가 많음
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 페이지마다 타이틀크기 설정
        navigationItem.largeTitleDisplayMode = .automatic
        
        
        navigationItem.leftBarButtonItems = [barButtonItem]
        
        let barButtonItem2 = UIBarButtonItem(title: "Next2", style: .plain, target: self, action: #selector(pushViewController(_:)))
        
        // 바버튼 아이콘 설정
        let barButtonItem3 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushViewController(_:)))
    }

    @objc private func pushViewController(_ sender: Any) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
//        show(secondVC, sender: sender)
    }

}
