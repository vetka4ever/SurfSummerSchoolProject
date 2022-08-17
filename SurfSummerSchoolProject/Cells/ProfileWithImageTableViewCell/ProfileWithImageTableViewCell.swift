//
//  ProfileWithImageTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 16.08.2022.
//

import UIKit

class ProfileWithImageTableViewCell: UITableViewCell {

    @IBOutlet private var viewImage: UIImageView!
    @IBOutlet private var nameTitleLabel: UILabel!
    @IBOutlet private var smartMindTitleLabel: UILabel!
    
    var image: UIImage?{
        didSet{
            viewImage.layer.cornerRadius = 12
            viewImage.contentMode = .scaleAspectFill
            viewImage.image = image
            
        }
    }
    
    var nameTitle: String = ""{
        didSet{
            nameTitleLabel.text = nameTitle
        }
    }
    
    var smartMindTitle: String = ""{
        didSet{
            smartMindTitleLabel.text = smartMindTitle
        }
    }
}
