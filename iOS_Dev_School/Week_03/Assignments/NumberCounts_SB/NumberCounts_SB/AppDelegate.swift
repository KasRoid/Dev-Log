//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by Kas Song on 2020.04.23.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // 앱이 실행될 때 관련된 것들을 관리하는 곳
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("didFinishLaunchingwithOptions")
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // active 상태가 되었을 때
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // active 상태를 잃었을 때
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // background 로 갈 때
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // foreground 로 들어갈 때
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // 앱이 종료될 때
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

