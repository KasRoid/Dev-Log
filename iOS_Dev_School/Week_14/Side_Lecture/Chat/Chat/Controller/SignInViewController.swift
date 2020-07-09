//
//  SignInViewController.swift
//  Chat
//
//  Created by Lee on 2020/07/08.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
  
  private let vSignIn = SignInView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setConstraint()
  }
}



// MARK: - UI

extension SignInViewController {
  private func setUI() {
    view.backgroundColor = .systemBackground
    
    vSignIn.delegate = self
    view.addSubview(vSignIn)
  }
  
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    vSignIn.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      vSignIn.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      vSignIn.bottomAnchor.constraint(equalTo: guide.centerYAnchor),
      vSignIn.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.8)
    ])
  }
}



// MARK: - SignInViewDelegate

extension SignInViewController: SignInViewDelegate {
  func signInButtonDidTap(email: String?, password: String?) {
    guard let email = email, let password = password else { return }
    
    let pSign = SignProvider()
    
    pSign.signIn(email: email, password: password) { (result) in
      switch result {
      case .failure(let error):
        self.alertNormal(title: error.localizedDescription)
        
      case .success:
        WindowManager.set(.chat)
      }
    }
  }
  
  func signUpButtonDidTap() {
    let vcSignUp = SignUpViewController()
    present(vcSignUp, animated: true)
  }
}
