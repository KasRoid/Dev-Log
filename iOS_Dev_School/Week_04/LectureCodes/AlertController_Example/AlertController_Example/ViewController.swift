//
//  ViewController.swift
//  AlertController_Example
//
//  Created by Kas Song on 2020.04.28.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "제목", message: "메세지", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in print ("확인 버튼")}
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { _ in print("취소 버튼")}
        let destructiveAction = UIAlertAction(title: "삭제", style: .destructive) { _ in print("삭제 버튼")}
        
        alertController.addAction(okAction)
        alertController.addAction(destructiveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
