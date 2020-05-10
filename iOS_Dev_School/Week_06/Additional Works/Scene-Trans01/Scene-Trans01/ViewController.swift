//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by Kas Song on 2020.05.10.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: UIButton) {
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        // Transition 스타일 설정
        uvc.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        uvc.modalPresentationStyle = .fullScreen
        
        // 인스턴스화된 뷰 컨트롤러를 호출
        self.present(uvc, animated: true)
    }
    
}
