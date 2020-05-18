//
//  MainPageViewController.swift
//  LoginPage_Exercise
//
//  Created by Kas Song on 2020.05.14.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    
    var mainLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 350, height: 50)
        label.text = "성공적으로 로그인되셨습니다."
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.layer.borderWidth = 0
        label.layer.borderColor = UIColor.lightGray.cgColor
        return label
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame.size = CGSize(width: 150, height: 40)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(buttonGoBack(_:)), for: .touchUpInside)
        return button
    }()

    // MARK: - Interface
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateUI()
    }
    
    func updateUI() {
        mainLabel.frame.origin = CGPoint(x: view.frame.midX - 175, y: view.frame.midY - 125)
        logoutButton.frame.origin = CGPoint(x: view.frame.midX - 75, y: view.frame.midY - 20)
        [mainLabel, logoutButton].forEach { view.addSubview($0) }
    }
    
    // MARK: - Actions
    @objc func buttonGoBack(_ sender: UIButton) {
        if presentingViewController == nil {
            UserDefaults.standard.set(false, forKey: UserInfo.loggedIn)
            logoutUserDefault()
        }
        else {
            UserDefaults.standard.set(false, forKey: UserInfo.loggedIn)
            dismiss(animated: true, completion: nil)
        }
    }
    
    func logoutUserDefault() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let sceneDelegate = windowScene.delegate as? SceneDelegate
            sceneDelegate?.window?.rootViewController = LoginPageViewController()
            sceneDelegate?.window?.backgroundColor = .white
        }
    }
    
}

