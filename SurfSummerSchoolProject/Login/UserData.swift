//
//  UserData.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 16.08.2022.
//

import Foundation
class UserData{
    private var keys = ["token", "login", "password", "phone", "city", "firstName", "id", "avatar", "email", "about", "lastName"]
    
    enum DataType: String{
        case token = "token"
        case login = "login"
        case password = "password"
        case phone = "phone"
        case city = "city"
        case firstName = "firstName"
        case id = "id"
        case avatar = "avatar"
        case email = "email"
        case about = "about"
        case lastName = "lastName"
        case identifiersOfFavoritePictures = "identifiersOfFavoritePictures"
    }
    func write(dictionary: [String:String]){
        dictionary.keys.forEach { key in
            UserDefaults.standard.set(dictionary[key], forKey: key)
        }
    }
    
    func getValue(dataType: DataType) -> String?{
        var value: String? = nil
        if dataType != .login && dataType != .password{
            value = UserDefaults.standard.value(forKey: dataType.rawValue) as? String
        }
        return value
    }
    
    func refreshData(compilationHandler: @escaping ()->()){
        guard let login = UserDefaults.standard.value(forKey: DataType.login.rawValue) as? String, let password = UserDefaults.standard.value(forKey: DataType.password.rawValue) as? String else {return}
        
        let param: [String:String] = ["phone": "\(login)", "password": "\(password)"]
        let body = try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
        let url = RequestHelper().getUrl(typeOfQuery: .loginParam)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let newData = data else {print(error?.localizedDescription ?? "NO DATA"); return}
            let answer = try? JSONSerialization.jsonObject(with: newData, options: .fragmentsAllowed) as? [String:Any]
            guard let saveAnswer = answer else {return}
            
            let token = saveAnswer["token"] as! String
            var userData = saveAnswer["user_info"] as! [String:String]
            userData["token"] = token
            self.write(dictionary: userData)
            compilationHandler()
        }.resume()
        
    }
    
    func deleteAllData(){
        
        keys.forEach { key in
            UserDefaults.standard.removeObject(forKey: key)
        }
        UserDefaults.standard.removeObject(forKey: DataType.identifiersOfFavoritePictures.rawValue
        )
        
    }
}
