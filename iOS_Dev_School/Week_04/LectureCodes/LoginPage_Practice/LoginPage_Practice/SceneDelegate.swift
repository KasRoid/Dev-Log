//
//  SceneDelegate.swift
//  LoginPage_Practice
//
//  Created by Kas Song on 2020.04.28.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ViewController()
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
}
