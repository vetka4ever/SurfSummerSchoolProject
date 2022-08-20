//
//  ImageResponse.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 09.08.2022.
//

import Foundation
import UIKit

class ImageResponse {
    
    
    init(id: String, title: String, content: String, image: UIImage, publicationDate: Date){
        self.id = id
        self.title = title
        self.content = content
        self.image = image
        self.publicationDate = publicationDate
        
    }
    var id: String
    var title: String
    var content: String
    var image: UIImage
    var isFavotire: Bool = false
    private var publicationDate: Date = Date()
    
    var dateInCorrectFormat: String{
        get{
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .day, .month], from: publicationDate)
            let day = (components.day! < 10) ? ("0\(components.day!)") : ("\(components.day!)")
            let month = (components.month! < 10) ? ("0\(components.month!)") : ("\(components.month!)")
                    let newDate = "\(day).\(month).\(components.year!)"
            return newDate
        }
    }
}
