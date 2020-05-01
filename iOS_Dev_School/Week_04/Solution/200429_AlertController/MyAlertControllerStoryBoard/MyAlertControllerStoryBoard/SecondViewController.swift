//
//  SecondViewController.swift
//  MyAlertControllerStoryBoard
//
//  Created by Lee on 2019/12/03.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

enum UnwindType {
  case cancel
  case enter
}

class SecondViewController: UIViewController {
  
  var myUnwindType: UnwindType = .cancel

  @IBOutlet weak var contentTextField: UITextField!
  
  @IBAction func cancelAction(_ sender: UIButton) {
    myUnwindType = .cancel
  }
  
  @IBAction func enterAction(_ sender: UIButton) {
    myUnwindType = .enter
  }
}
