//
//  FavoriteModel.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import Foundation
import UIKit
class FavoriteModel{
    
    // MARK: Properties
    var presenter: FavoritePresenter? = nil
    // MARK: Methods
    func removeIdOfFavoritePicture(id: String){
        var array = UserDefaults.standard.value(forKey: UserData.DataType.identifiersOfFavoritePictures.rawValue) as? [String]
        UserDefaults.standard.removeObject(forKey: UserData.DataType.identifiersOfFavoritePictures.rawValue)
        var newArr = [String]()
        
        if var array = array {
            for item in array where item != id{
                newArr.append(item)
            }
                UserDefaults.standard.set(newArr, forKey: UserData.DataType.identifiersOfFavoritePictures.rawValue)
            print(UserDefaults.standard.value(forKey: UserData.DataType.identifiersOfFavoritePictures.rawValue))
            
            
        }
    }
}
