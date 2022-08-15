//
//  FavoritePresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import Foundation
class FavoritePresenter{
    // MARK: Properties
    private var model: FavoriteModel = .init()
    
    // MARK: Methods
    
    func getCountOfFavoriteItems() -> Int{
        model.getCountOfFavoriteItems()
    }
    
    func getItemsWithId(id: Int) -> FavoriteModel.FavoriteItem{
        return model.getItemsWithId(id: id)
    }
    
}
