//
//  ViewController.swift
//  Assignment 01
//
//  Created by Kas Song on 2020.04.27.
//  Copyright © 2020 Kas Song. All rights reserved.
//

/*
 [ 과제 ]
 1. ViewController 데이터 전달
   > AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
   > A에서 B로 화면을 넘어갈 때는 B의 Label 값이 이전 값에서 +3 증가
   > B에서 A로 화면을 넘어갈 때는 A의 Label 값이 이전 값에서 +1 증가
     e.g. A에서 B로 갈 때 3, B에서 다시 A로 넘어올 때 4, 다시 A에서 B로 가면 7, 다시 A로 오면 8
 */


import UIKit

var counter = 1
var labelA = UILabel()

class ViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    var btnToB = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.presentationController?.delegate = self
        
        labelA.text = String(counter)
        labelA.font = UIFont.systemFont(ofSize: 80)
        labelA.frame = CGRect(x: 180, y: 200, width: 50, height: 50)
        labelA.sizeToFit()
        labelA.textAlignment = .center
        labelA.center = view.center
        view.addSubview(labelA)
        
        btnToB.setTitle("Go to Screen B", for: .normal)
        btnToB.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btnToB.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY + 150, width: 50, height: 50)
        btnToB.sizeToFit()
        view.addSubview(btnToB)
        btnToB.addTarget(self, action: #selector(goToScreenB(_:)), for: .touchUpInside)
    }
    
    @objc func goToScreenB (_ sender: UIButton) {
        counter += 3
        let nextVC = BViewController()
        labelA.text = String(counter)
        labelA.sizeToFit()
        labelB.sizeToFit()
        labelB.center = view.center
        
        present(nextVC, animated: true)
    }
    
//    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
//        print("Attemped")
//        dismiss(animated: true)
//    }
}
