//
//  SigninViewController.swift
//  Chat_Practice
//
//  Created by Doyoung Song on 7/8/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    // MARK: - Properties
    private let vSignIn = SignInView()
    
    
    // MARK: - Lifecycle
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


extension SignInViewController: SignInViewDelegate {
    func signInButtonDidTap(email: String?, password: String?) {
        guard let email = email, let password = password else { return }
        let psign = SignProvider()
        psign.signIn(email: email, password: password) { (result) in
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
