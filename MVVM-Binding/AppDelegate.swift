//
//  AppDelegate.swift
//  MVVM-Binding
//
//  Created by KhaleD HuSsien on 11/09/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }


}

