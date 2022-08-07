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
    private var items: [ItemModel] = []
    
    // MARK: - Methods
    func getPosts(){
        items = Array(repeating: ItemModel.createDefault(), count: 100)
    }
    
    struct ItemModel{
        let image: UIImage?
        let title: String
        var isFavotire: Bool
        let dateCreation: String
        let content: String
        
        
        static func createDefault() -> ItemModel{
            .init(image: UIImage(named: "default-image"), title: "Чашечка свежего кофе", isFavotire: false, dateCreation: "12.05.2022", content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n Теперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта.")
        }
    }
    
    func getItem(id: Int) -> ItemModel{
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

