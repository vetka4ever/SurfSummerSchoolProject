//
//  TabBarModel.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import Foundation
import UIKit
enum TabBarModel{
    case main
    case favourite
    case profile
    
    var title: String{
        switch self{
        case .main:
            return "Главная"
        case .favourite:
            return "Избранное"
        case .profile:
            return "Профиль"
        }
        
    }
    
    var image: UIImage?{
        switch self{
        case .main:
            return UIImage(named: "main")
        case .favourite:
            return UIImage(named: "favourite")
        case .profile:
            return UIImage(named: "profile")
        }
    }
    
    var selectedImage: UIImage?{
        return image
    }
    
}

