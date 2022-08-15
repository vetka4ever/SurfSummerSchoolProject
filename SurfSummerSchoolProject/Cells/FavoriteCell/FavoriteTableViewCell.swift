//
//  FavoriteTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 07.08.2022.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    
 // MARK: Views
    @IBOutlet private var viewImage: UIImageView!
    @IBOutlet private weak var hideMainTitle: UILabel!
    @IBOutlet private weak var hideDateTitle: UILabel!
    @IBOutlet private weak var hideUnderTitle: UILabel!
    
    // MARK: Properties
    var image: UIImage?{
        didSet{
            viewImage.image = image
        }
    }
    
    var countOfLines: Int = 1{
        didSet{
            hideUnderTitle.numberOfLines = countOfLines
            
        }
    }
    
    var mainTitle: String = ""{
        didSet{
            hideMainTitle.text = mainTitle
        }
    }
    
    var dateTitle: String = ""{
        didSet{
            hideDateTitle.text = dateTitle
            hideDateTitle.textColor = UIColor(red: 0.702, green: 0.702, blue: 0.702, alpha: 1)
        }
    }
    
    var underTitle: String = ""{
        didSet{
            hideUnderTitle.text = underTitle
        }
    }
    
    
}
