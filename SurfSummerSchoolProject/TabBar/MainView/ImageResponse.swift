//
//  ImageResponse.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 09.08.2022.
//

import Foundation

struct ImageResponse: Decodable {
    let id: String
    let title: String
    let content: String
    let photoUrl: String
    let publicationDate: Int
}
