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
    private func getPosts(){
        let url = helper.getUrl(typeOfQuery: .getPicture)
        var token = userData.getValue(dataType: .token)!
        token = "Token " + token
        print(url)
        
        print(token)
        var request = URLRequest(url: url)
        
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let newData = data else{print(error?.localizedDescription ?? "NO DATA"); return}
            let answer = try? JSONSerialization.jsonObject(with: newData, options: .fragmentsAllowed) as? [NSDictionary]
            
            
            answer?.forEach({ item in
            let imageResponse = ImageResponse()
                imageResponse.id = item["id"] as! String
                imageResponse.title = item["title"] as! String
                imageResponse.content = item["content"] as! String
                imageResponse.photoUrl = item["photoUrl"] as! String
                let imageUrl = URL(string: imageResponse.photoUrl)
                let data = try? Data(contentsOf: imageUrl!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                imageResponse.image = UIImage(data: data!)!
                imageResponse.publicationDate = Date(timeIntervalSince1970: TimeInterval((item["publicationDate"] as! Int) / 1000))
                self.response.append(imageResponse)
            
            })
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

}

