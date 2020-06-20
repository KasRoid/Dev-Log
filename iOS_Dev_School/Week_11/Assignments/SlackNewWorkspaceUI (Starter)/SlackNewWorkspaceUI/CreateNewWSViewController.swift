//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

final class CreateNewWSViewController: UIViewController {
    
    // MARK: - Properties
    lazy var createWorkSpaceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create New Workspace", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23)
        button.addTarget(self, action: #selector(handleCreateWorkSpaceButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        createWorkSpaceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createWorkSpaceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createWorkSpaceButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    // MARK: - Selectors
    @objc private func handleCreateWorkSpaceButton(_ sender: UIButton) {
        let VC = NameWSViewController()
        let naviVC = UINavigationController(rootViewController: VC)
        naviVC.navigationBar.barTintColor = .white
        naviVC.navigationBar.shadowImage = UIImage()
        naviVC.navigationBar.isTranslucent = true
        naviVC.modalPresentationStyle = .fullScreen
        present(naviVC, animated: true)
    }
    
}
