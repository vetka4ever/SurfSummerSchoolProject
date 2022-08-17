//
//  ProfileWithTitlesTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 16.08.2022.
//

import UIKit

class ProfileWithTitlesTableViewCell: UITableViewCell {

    @IBOutlet private var smallTitleLabel: UILabel!
    @IBOutlet private var bigTitleLabel: UILabel!
    
    var smallTitle: String = ""{
        didSet{
            smallTitleLabel.text = smallTitle
        }
    }
    
    var bigTitle: String = ""{
        didSet{
            bigTitleLabel.text = bigTitle
        }
    }
}
