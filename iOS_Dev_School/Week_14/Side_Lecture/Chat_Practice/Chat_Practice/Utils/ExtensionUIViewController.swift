//
//  ExtensionUIViewController.swift
//  Chat_Practice
//
//  Created by Doyoung Song on 7/8/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - AlertController
    func alertNormal(title: String? = nil, message: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let cancel = UIAlertAction(title: "닫기", style: .cancel, handler: handler)
      alert.addAction(cancel)
      self.present(alert, animated: true)
    }
    
    func alertSingleTextField(title: String? = nil, message: String? = nil, actionTitle: String, keyboardType: UIKeyboardType = .default, completion: @escaping (String?) -> ()) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addTextField { $0.keyboardType = keyboardType }
      
      let action = UIAlertAction(title: actionTitle, style: .default) { (_) in
        let text = alert.textFields?[0].text
        completion(text)
      }
      let cancel = UIAlertAction(title: "닫기", style: .cancel)
      
      alert.addAction(action)
      alert.addAction(cancel)
      self.present(alert, animated: true)
    }
}
