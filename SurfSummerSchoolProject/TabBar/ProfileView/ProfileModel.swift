//
//  ProfileModel.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import Foundation
import UIKit
class ProfileModel{
    // MARK: - Properties
    private var userData = UserData()
    private var userImage = UIImage()
    private var helper = RequestHelper()
    private var presenter: ProfilePresenter? = nil
    
    var accessToPresenter: ProfilePresenter?{
        didSet{
            presenter = accessToPresenter
        }
    }
    var city: ProfileWithTitlesModel{
        let model = ProfileWithTitlesModel()
        model.smallTitleLabel = "Город"
        model.bigTitleLabel = userData.getValue(dataType: .city)!
        return model
    }
    
    var phoneNumber: ProfileWithTitlesModel{
        let model = ProfileWithTitlesModel()
        model.smallTitleLabel = "Телефон"
        model.bigTitleLabel = userData.getValue(dataType: .phone)!
        return model
    }
    
    var email: ProfileWithTitlesModel{
        let model = ProfileWithTitlesModel()
        model.smallTitleLabel = "Почта"
        model.bigTitleLabel = userData.getValue(dataType: .email)!
        return model
    }
    
    var shortInfo: ProfileWithImageModel{
        
        let model = ProfileWithImageModel()
        guard let name = userData.getValue(dataType: .firstName), let lastName = userData.getValue(dataType: .lastName), let about = userData.getValue(dataType: .about) else {return ProfileWithImageModel()}
        model.nameTitle = name + "\n" + lastName
//        «Светлое будущее живет в вечности»
        model.smartMindTitle = "«"+about+"»"
        
        let imageUrl = URL(string: userData.getValue(dataType: .avatar)!)
        let data = try? Data(contentsOf: imageUrl!) 
        model.viewImage = UIImage(data: data!)!
//        model.viewImage = UIImage(named: "image 4")!
        
        return model
    }
    // MARK: - Methods
    func deleteAllDataOfUser(){
        let url = helper.getUrl(typeOfQuery: .logoutParam)
        var token = userData.getValue(dataType: .token)!
        token = "Token " + token
        print(url)
        
        print(token)
        var request = URLRequest(url: url)
        
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let newData = data else{print(error?.localizedDescription ?? "NO DATA"); return}
            let answer = try? JSONSerialization.jsonObject(with: newData, options: .fragmentsAllowed)
            if newData.count == 0{
                self.userData.deleteAllData()
                if let presenter = self.presenter {
                    DispatchQueue.main.async {
                        presenter.exitProfile()
                    }
                }
            }
            
            
        }.resume()
    }
        
        

    
    
    
    
    
    
}
