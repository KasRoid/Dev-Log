//
//  NextViewController.swift
//  ViewControllerPractice
//
//  Created by Kas Song on 2020.04.27.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad -next VC-")
                
        let button = UIButton(type: .system)
        button.setTitle("Dismiss", for: .normal)
        button.sizeToFit() // 버튼의 프레임 크기를 폰트의 크기에 알맞게 조정
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//      print("\n---------- [ viewWillAppear - next vc ] ----------\n")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//      super.viewDidAppear(animated)
//      print("\n---------- [ viewDidAppear - next vc ] ----------\n")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//      super.viewWillDisappear(animated)
//      print("\n---------- [ viewWillDisappear - next vc ] ----------\n")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//      super.viewDidDisappear(animated)
//      print("\n---------- [ viewDidDisappear - next vc ] ----------\n")
//    }
//
//    deinit {
//        print("Deinitialized NV")
//    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        // self.presentingViewController : 나를 띄운 뷰컨트롤러, 즉 ViewController
        // self.presentedViewController : 내가 띄운 뷰컨트롤러, 즉 NextViewController
        
        let color: [UIColor] = [.white, .cyan]
        presentingViewController?.view.backgroundColor = color.randomElement()!
        
        if let vc = presentingViewController as? ViewController {
            vc.button.setTitle("클릭", for: .normal)
        }
        
        presentingViewController?.dismiss(animated: true) // 화면을 닫을 때 사용한다.
    }
}
