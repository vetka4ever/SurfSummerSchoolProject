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
    private var response: [ImageResponse] = []
    //    private var response: [ImageResponse] = []
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
     func getPosts(){
        let url = helper.getUrl(typeOfQuery: .getPicture)
        var token = userData.getValue(dataType: .token)!
        token = "Token " + token
        print(url)
        
        print(token)
        var request = URLRequest(url: url)
        
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
         self.writeIdOfFavoritePictures()
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let newData = data else{print(error?.localizedDescription ?? "NO DATA"); return}
            let answer = try? JSONSerialization.jsonObject(with: newData, options: .fragmentsAllowed) as? [NSDictionary]
            
            
            var newResponse = [ImageResponse]()
            answer?.forEach({ item in
                
//                imageResponse.id =
//                imageResponse.title =
//                imageResponse.content =
                
                let imageUrl = URL(string: item["photoUrl"] as! String)
                let data = try? Data(contentsOf: imageUrl!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//                imageResponse.image =
                let date =  Date(timeIntervalSince1970: TimeInterval((item["publicationDate"] as! Int) / 1000))
                let imageResponse = ImageResponse(id: item["id"] as! String,
                                                  title: item["title"] as! String,
                                                  content: item["content"] as! String,
                                                  image: UIImage(data: data!)!,
                                                  publicationDate: date)
                newResponse.append(imageResponse)
                
                
            })
            self.response = newResponse
            self.getIdOfFavoritePictures()
            
            DispatchQueue.main.async {
                self.presenter?.dataLoaded()
            }
            
        }.resume()
    }
    
    
    
    func getItem(id: Int) -> ImageResponse{
        response[id]
    }
    
    func getCountOfItems() -> Int{
        response.count
    }
    
    func getTitleOfItem(id: Int) -> String{
        response[id].title
    }
    
    func getImageOfItem(id: Int) -> UIImage?{
        response[id].image
    }
    
    func getFavoriteOfItem(id: Int) -> Bool{
        response[id].isFavotire
    }
    
    func updateFavoriteStatus(id: Int){
        response[id].isFavotire.toggle()
    }
    
    func getFavoritePictures() -> [ImageResponse]{
        var res = [ImageResponse]()
        response.forEach { item in
            if item.isFavotire{
                res.append(item)
            }
        }
        return res
    }
    
    func getIdOfFavoritePictures(){
        let identifiers = UserDefaults.standard.value(forKey: "identifiersOfFavoritePictures")
        response.forEach { item in
            item.isFavotire = false
        }
        if let identifiers = identifiers as? [String] {
            response.forEach { item in
                identifiers.forEach { id in
                    if item.id == id{
                        item.isFavotire = true
                    }
                }
            }
        }
    }
    
    func writeIdOfFavoritePictures(){
        var identifiers = [String]()
        response.forEach { item in
            if item.isFavotire{
                identifiers.append(item.id)
            }
        }
        UserDefaults.standard.removeObject(forKey: UserData.DataType.identifiersOfFavoritePictures.rawValue)
        UserDefaults.standard.set(identifiers, forKey: UserData.DataType.identifiersOfFavoritePictures.rawValue)
        print(UserDefaults.standard.value(forKey: UserData.DataType.identifiersOfFavoritePictures.rawValue))
    }
    
}

