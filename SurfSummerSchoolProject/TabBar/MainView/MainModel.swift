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
    private var helper = RequestHelper()
    private var presenter: MainPresenter? = nil
    private var userData = UserData()
    
    var setPresenter: MainPresenter?{
        didSet{
            presenter = setPresenter
        }
    }
    
    init(){
        print(userData.getValue(dataType: .token))
        userData.refreshData {
            print(self.userData.getValue(dataType: .token))
            self.getPosts()
        }
    }
    
    
    
    
    // MARK: - Methods
    private func getPosts(){
        let url = helper.getUrl(typeOfQuery: .getPicture)
        let token = userData.getValue(dataType: .token)!
        print(token)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print("Token \(token)")
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        request.addValue("gzip, deflate, br", forHTTPHeaderField: "Accept-Encoding")
        
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let newData = data else{print(error?.localizedDescription ?? "NO DATA"); return}
            let answer = try? JSONSerialization.jsonObject(with: newData, options: .fragmentsAllowed)
            print(answer)
        }.resume()
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

