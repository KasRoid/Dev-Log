//
//  ThirdViewController.swift
//  TapBarController
//
//  Created by Kas Song on 2020.05.08.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    lazy var barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushViewController(_:)))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "ThirdVC"
        view.backgroundColor = .systemTeal
        
        navigationItem.rightBarButtonItems = [barButtonItem]
    }
    
    @objc private func pushViewController(_ sender: Any) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
        //        show(secondVC, sender: sender)
    }

}
