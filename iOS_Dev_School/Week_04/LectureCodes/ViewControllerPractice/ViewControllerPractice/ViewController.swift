//
//  ViewController.swift
//  ViewControllerPractice
//
//  Created by Kas Song on 2020.04.27.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .white
        
        button.setTitle("Button", for: .normal)
        button.sizeToFit() // 버튼의 프레임 크기를 폰트의 크기에 알맞게 조정
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        // Do any additional setup after loading the view.
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//      print("\n---------- [ viewWillAppear - vc ] ----------\n")
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//      super.viewDidAppear(animated)
//      print("\n---------- [ viewDidAppear - vc ] ----------\n")
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//      super.viewWillDisappear(animated)
//      print("\n---------- [ viewWillDisappear - vc ] ----------\n")
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//      super.viewDidDisappear(animated)
//      print("\n---------- [ viewDidDisappear - vc ] ----------\n")
//    }
//    
//    deinit {
//        print("Deinitialized") // iOS 12 이하에서 실행이 되어야 함
//    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        let nextVC = NextViewController()
        nextVC.isModalInPresentation = true // 당겨서 창을 닫을 수 없다.
//        nextVC.modalPresentationStyle = .fullScreen // 카드 스타일이 아닌 예전 스타일 호출
        nextVC.view.backgroundColor = .lightGray // 만들기 직전 색 호출
        present(nextVC, animated: true) // present는 다른 뷰 컨트롤러를 띄울 때 사용한다.
    }
}

