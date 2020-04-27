//
//  SceneDelegate.swift
//  ViewControllerPractice
//
//  Created by Kas Song on 2020.04.27.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        // iOS 13 이상, 스토리보드 안쓸 때만
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ViewController()
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = .systemBackground // 라이드모드 or 다크모드 적용
        window?.makeKeyAndVisible()
    }
}

