//
//  ViewController.swift
//  DataTransfer_Segue
//
//  Created by Giftbot on 2020/05/06.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  var imageName = "dog"
  var tapCount = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.image = UIImage(named: imageName)
  }
  
  @IBAction private func didTap1UpButton(_ sender: Any) {
    tapCount += 1
  }
}
