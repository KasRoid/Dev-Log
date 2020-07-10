//
//  SceneDelegate.swift
//  CafeSpot
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        let naviVC = UINavigationController(rootViewController: HomeViewController())
        let mapVC = MapViewController()
        let tabBarController = UITabBarController()
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        let mapTabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 1)
        
        naviVC.tabBarItem = homeTabBarItem
        mapVC.tabBarItem = mapTabBarItem
        
        tabBarController.viewControllers = [naviVC, mapVC]
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
}
