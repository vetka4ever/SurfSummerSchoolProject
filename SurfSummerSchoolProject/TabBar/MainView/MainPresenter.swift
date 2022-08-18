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
    private var view: MainViewController? = nil
    
    init(){
        model.setPresenter = self
    }
    
    // MARK: - Methods For View
    var setView: MainViewController?{
        didSet{
            view = setView
        }
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
    func getItem(id: Int) -> ImageResponse{
        model.getItem(id: id)
    }
    
    func updateFavoriteStatus(id: Int){
        model.updateFavoriteStatus(id: id)
        
    }
    
    func prepareDetailView(id: Int) -> DetailViewController{
//        let item = model.getItem(id: id)
        let view = DetailViewController()
//        view.accessToModel = item
        return view
    }
    
    // MARK: - Methods For Model
    func dataLoaded(){
        view?.reloadCollectionView()
    }
}
