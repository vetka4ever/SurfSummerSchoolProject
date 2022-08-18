//
//  RequestHelper.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 09.08.2022.
//

import Foundation

class RequestHelper{
    //MARK: - Property
    private var baseUrl = "https://pictures.chronicker.fun/api"
    
    enum TypeOfRequest: String{
        case loginParam = "/auth/login"
        case logoutParam = "/auth/logout"
        case getPicture = "/picture/"
    }
    //MARK: - Methods
    func getUrl(typeOfQuery: TypeOfRequest) -> URL{
        let stringUrl = baseUrl + typeOfQuery.rawValue
        let url = URL(string: stringUrl)!
        return url
    }
}

