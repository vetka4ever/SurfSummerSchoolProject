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
    private var items: [FavoriteItem] = Array(repeating: FavoriteItem.getDefault(), count: 100)
        

    
    struct FavoriteItem{
        let image: UIImage?
        let mainTitle: String
        let dateTitle: String
        let underTitle: String
        
        static func getDefault() -> FavoriteItem{
            return .init(image: UIImage(named: "favoriteImage"),
                         mainTitle: "Первый день в Surf ",
                         dateTitle: "12.05.2022",
                         underTitle: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n Теперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта.")
        }
        
    }
    
    // MARK: Methods
    func getCountOfFavoriteItems() -> Int{
        print(items.count)
        return items.count
    }
    
    func getItemsWithId(id: Int) -> FavoriteItem{
        return items[id]
    }
    
    func removeWrongItem(id: Int){
        if items.count > id{
            items.remove(at: id)
        }
    }
}
