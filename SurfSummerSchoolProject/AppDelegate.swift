//
//  AppDelegate.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 02.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = TabBarConfigurator().configure()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        return true
    }



}

