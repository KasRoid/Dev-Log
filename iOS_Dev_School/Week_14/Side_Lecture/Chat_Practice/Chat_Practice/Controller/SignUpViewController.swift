//
//  SignUpViewController.swift
//  Chat
//
//  Created by Lee on 2020/07/08.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    // MARK: - Properties
    private let pSign = SignProvider()
    private let vSignUp = SignUpView()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
    }
}


// MARK: - UI
extension SignUpViewController {
    private func setUI() {
        view.backgroundColor = .systemBackground
        
        vSignUp.delegate = self
        view.addSubview(vSignUp)
    }
    
    private struct Standard {
        static let space: CGFloat = 8
        
    }
    
    private func setConstraint() {
        let guide = view.safeAreaLayoutGuide
        
        vSignUp.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vSignUp.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            vSignUp.bottomAnchor.constraint(equalTo: guide.centerYAnchor),
            vSignUp.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.8)
        ])
    }
}



extension SignUpViewController: SignUpViewDelegate {
    func signUpButtonDidTap(email: String?, password: String?, nickName: String?) {
        guard let email = email, let password = password, let nickName = nickName else { return }
        
        pSign.signUp(email: email, password: password, nickName: nickName) { (result) in
            switch result {
            case .failure(let error):
                self.alertNormal(title: error.localizedDescription)
            case . success:
                self.dismiss(animated: true)
            }
        }
    }
}
