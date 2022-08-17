//
//  ProfilePresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import Foundation
import UIKit
class ProfilePresenter{
    //MARK: - Properties
    private var model: ProfileModel = .init()
    private var view: ProfileViewController? = nil
    private var dictionary = [
        0 : InfoByNumber.shortInfo,
        1 : InfoByNumber.city,
        2 : InfoByNumber.phoneNumber,
        3 : InfoByNumber.email
    ]
    
    var countOfCells: Int{
        return dictionary.count
    }
    
    var setView: ProfileViewController?{
        didSet{
            view = setView
        }
    }
    
    
    enum InfoByNumber: Int{
        case shortInfo = 0
        case city = 1
        case phoneNumber = 2
        case email = 3
    }
    
    
    
    //MARK: - Methods For View
    func getInfoForCell(typeInfo: Int) -> Any?{
        let info = dictionary[typeInfo]!
        var res: Any? = nil
        switch info{
            
        case .shortInfo:
            res = model.shortInfo
        case .city:
            res = model.city
        case .phoneNumber:
            res = model.phoneNumber
            if let newRes = res as? ProfileWithTitlesModel{
                
                var partsOfNumber = Array(repeating: [String](), count: 6)
                var formatNumber = String()
                
                partsOfNumber[0] = [String(newRes.bigTitleLabel.removeFirst())]
                partsOfNumber[1] = [String(newRes.bigTitleLabel.removeFirst())]
                for i in 0..<6{
                    partsOfNumber[i < 3 ? (2) :(3)].append(String(newRes.bigTitleLabel.removeFirst()))
                }
                for i in 0..<4{
                    partsOfNumber[i < 2 ? (4) :(5)].append(String(newRes.bigTitleLabel.removeFirst()))
                }
                for i in 0...partsOfNumber.count - 1{
                    partsOfNumber[i].forEach { letter in
                        formatNumber += letter
                    }
                    if i == 2{ formatNumber += ")"}
                    formatNumber += " "
                    if i == 1{ formatNumber += "("}
                    
                }
                newRes.bigTitleLabel = formatNumber
            }
        case .email:
            res = model.email
        }
        
        return res
        
    }
    func deleteAllDataOfUser(){
        model.deleteAllDataOfUser()
        if let view = view{
            let nextView = LoginView()
            let navController = UINavigationController(rootViewController: nextView)
            view.goToLoginView(navigationController: navController)
        }
    }
    
    //MARK: - Methods For Model
    
}
