//
//  loginAnswer.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 09.08.2022.
//

import Foundation
struct LoginAnswer: Decodable {
    let userInfo: [String:String]
    let token: String
}

// MARK: - UserInfo
//struct UserInfo: Decodable {
//    let id: String
//    let phone: String
//    let email: String
//    let city: String
//    let firstName: String
//    let lastName: String
//    let avatar: String
//    let about: String
//}
