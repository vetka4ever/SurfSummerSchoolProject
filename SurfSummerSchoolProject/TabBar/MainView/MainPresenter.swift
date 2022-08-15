//
//  MainPresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import Foundation
import UIKit
final class MainPresenter{
    // MARK: - Private properties
    private let model: MainModel = .init()
    private var view = UIViewController()
    
    
    // MARK: - Methods For View
    func setView(view: MainViewController){
        self.view = view
    }
    
    func getCountOfItems() -> Int{
//        model.getPosts()
        
        return  model.getCountOfItems()
    }
    

    func getTitleOfItem(id: Int) -> String{
        model.getTitleOfItem(id: id)
    }
    
    func getImageOfItem(id: Int) -> UIImage?{
        model.getImageOfItem(id: id)
    }
    
    func getFavoriteOfItem(id: Int) -> Bool{
        model.getFavoriteOfItem(id: id)
    }
    func getItem(id: Int) -> DetailItemModel{
        model.getItem(id: id)
    }
    
    func updateFavoriteStatus(id: Int){
        model.updateFavoriteStatus(id: id)
        
    }
    
    func prepareDetailView(id: Int) -> DetailViewController{
        let item = model.getItem(id: id)
        let view = DetailViewController()
        view.accessToModel = item
        return view
    }
}
