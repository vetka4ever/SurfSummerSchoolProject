//
//  MainModel.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import Foundation
import UIKit

final class MainModel{
    
    //MARK: - Properties
    private var items: [DetailItemModel] = []
    
    // MARK: - Methods
    func getPosts(){
        items = Array(repeating: DetailItemModel.createDefault(), count: 100)
    }
    
   
    
    func getItem(id: Int) -> DetailItemModel{
        items[id]
    }
    
    func getCountOfItems() -> Int{
        items.count
    }
    
    func getTitleOfItem(id: Int) -> String{
        items[id].title
    }
    
    func getImageOfItem(id: Int) -> UIImage?{
        items[id].image
    }
    
    func getFavoriteOfItem(id: Int) -> Bool{
        items[id].isFavotire
    }
    
    func updateFavoriteStatus(id: Int){
        items[id].isFavotire.toggle()
        
    }
    
}

