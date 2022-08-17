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
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        if let name = UserData().getValue(dataType: .firstName){
            let controller = TabBarConfigurator().configure()
            window?.rootViewController = controller
        }
        else{
            let controller = UINavigationController(rootViewController: LoginView())
            window?.rootViewController = controller
        }
        window?.makeKeyAndVisible()
        return true
    }



}

