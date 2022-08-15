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
    
    init(){
        login()
    }
    
    private func login(){
        let body: [String: Any] = ["phone": "+71234567890", "password": "qwerty"]
        
        let json = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        let url = helper.getUrl(typeOfQuery: .loginParam)
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = json
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {print(error?.localizedDescription ?? "No data");return}
            guard let loginAnswer = try? JSONSerialization.jsonObject(with: data)  as? [String: Any] else {return}
            guard let userInfo = loginAnswer["user_info"] as? [String:String] else {return}
            print(userInfo)
            
        }.resume()
    }
    
    
    // MARK: - Methods
    private func getPosts(){
        //        let url = helper.getUrl(typeOfQuery: .loginParam)
        //        if let correctUrl = url{
        //            URLSession.shared.dataTask(with: correctUrl) { data, response, error in
        //                if let correctData = data{
        //                    let newData = try? JSONDecoder().decode(ImageResponse.self, from: correctData)
        //                    print(newData)
        //                }
        //                else{
        //                    print("\(MainModel.self): PROBLEMS WITH CORRECT DATA")
        //                }
        //
        //            }.resume()
        //        }
        //        else{
        //            print("\(MainModel.self): PROBLEMS WITH CORRECT URL")
        //        }
        //
        //
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

