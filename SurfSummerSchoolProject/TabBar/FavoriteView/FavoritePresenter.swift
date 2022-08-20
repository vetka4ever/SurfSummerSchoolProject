//
//  FavoritePresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import Foundation
import UIKit
class FavoritePresenter{
    // MARK: Properties
    private var model: FavoriteModel = .init()
    var view: FavoriteViewController? = nil
    init(){
        model.presenter = self
    }
    // MARK: Methods
    
    
    
    func removeIdOfFavoritePicture(id: String){
        model.removeIdOfFavoritePicture(id: id)
    }
    
    
    // MARK: Model Methods
    
}
