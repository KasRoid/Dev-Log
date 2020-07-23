//
//  SceneDelegate.swift
//  WeatherForecast
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let rootVC = HomeViewController()
        let naviRootVC = UINavigationController(rootViewController: rootVC)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = naviRootVC
        window?.makeKeyAndVisible()
    }
}
