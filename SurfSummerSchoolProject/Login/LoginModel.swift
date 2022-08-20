//
//  LoginModel.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 16.08.2022.
//

import Foundation
class LoginModel{
    // MARK: - Properties
    private var presenter: LoginPresenter? = nil
    private let helper = RequestHelper()
    var setPresenter: LoginPresenter?{
        didSet{
            presenter = setPresenter
        }
    }
    //MARK: - Methods
    
    func logIn(login: String, password: String) {
        let param: [String:String] = ["phone": "\(login)", "password": "\(password)"]
        
//        let param: [String:String] = ["phone": "+71234567890", "password": "qwerty"]
        
        let body = try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
        let url = helper.getUrl(typeOfQuery: .loginParam)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let newData = data else {print(error?.localizedDescription ?? "NO DATA"); return}
            let answer = try? JSONSerialization.jsonObject(with: newData, options: .fragmentsAllowed) as? [String:Any]
            guard let saveAnswer = answer else {return}
            
            if saveAnswer["code"] == nil{
                let token = saveAnswer["token"] as! String
                var userData = saveAnswer["user_info"] as! [String:String]
                userData["token"] = token
                userData[UserData.DataType.login.rawValue] = login
                userData[UserData.DataType.password.rawValue] = password

                let userDataClass = UserData()
                userDataClass.write(dictionary: userData)
                
                
                guard let presenter = self.presenter else {return}
                DispatchQueue.main.async {
                presenter.updateView()
                }
            }
            else{
                DispatchQueue.main.async {
                    if let presenter = self.presenter {
                        presenter.uncorrectLoginOrPassword()
                        
                    }
                }
            }
            
            
            
            
        }.resume()
    }
}
