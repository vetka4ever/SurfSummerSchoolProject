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
        
        
        return  model.getCountOfItems()
    }
    
    func getPosts(){
                model.getPosts()
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
        let item = model.getItem(id: id)
        
        
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.year, .day, .month], from: item.publicationDate)
//        let day = (components.day! < 10) ? ("0\(components.day!)") : ("\(components.day!)")
//        let month = (components.month! < 10) ? ("0\(components.month!)") : ("\(components.month!)")
//                let newDate = "\(day).\(month).\(components.year!)"
        let detailModel = DetailItemModel(image: item.image,
                                          title: item.title,
                                          isFavotire: item.isFavotire,
                                          dateCreation: item.dateInCorrectFormat,
                                          content: item.content)
        let view = DetailViewController()
        view.accessToModel = detailModel
        return view
    }
    
    func getFavoritePictures() -> [ImageResponse]{
        let res = model.getFavoritePictures()
        
        return res
    }
    
    func getIdOfFavoritePictures(){
        model.getIdOfFavoritePictures()
    }
    
    func saveIdOfFavoritesPictures(){
        model.writeIdOfFavoritePictures()
    }
    
    // MARK: - Methods For Model
    func dataLoaded(){
        view?.reloadCollectionView()
    }
}
