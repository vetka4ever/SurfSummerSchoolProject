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
        userData.deleteAllData()
    }
    
    
    
    
    
}
