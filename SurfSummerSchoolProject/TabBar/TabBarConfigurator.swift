//
//  TabBarConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import Foundation
import UIKit

final class TabBarConfigurator{
    
    //MARK: Private Property
    private let allTab: [TabBarModel] = [.main, .favourite, .profile]
    
    
    //MARK: Public Methods
    func configure() -> UITabBarController {
        return getTaBarController()
    }
    
    
    
   
}

private extension TabBarConfigurator {
    
    func getTaBarController() -> UITabBarController{
        let tabBar = UITabBarController()
        tabBar.tabBar.tintColor = .black
        tabBar.tabBar.unselectedItemTintColor = .lightGray
        tabBar.tabBar.backgroundColor = .white
        tabBar.viewControllers = getControllers()
        return tabBar
    }
    
    func getControllers() -> [UIViewController] {
        var viewControllers = [UIViewController]()
        allTab.forEach { tab in
            let view = getCurrentController(tab: tab)
            let navController = UINavigationController(rootViewController: view)
            view.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            viewControllers.append(navController)
        }
        return viewControllers
    }
    
    func getCurrentController(tab: TabBarModel) -> UIViewController{
        switch tab {
        case .main:
            return MainViewController()
        case .favourite:
            return FavoriteViewController()
        case .profile:
            return ProfileViewController()
        }
    }
}
        
