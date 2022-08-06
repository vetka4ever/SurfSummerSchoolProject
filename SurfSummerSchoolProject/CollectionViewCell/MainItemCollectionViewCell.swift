//
//  ItemCollectionViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 05.08.2022.
//

import UIKit

class MainItemCollectionViewCell: UICollectionViewCell {

    //MARK: - Constants
    private enum Constants{
        static let fillHeartImage = UIImage(named: "fillFavorite")
        static let heartImage = UIImage(named: "favourite")
    }
    
    //MARK: - Views
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var textTitle: UILabel!
    
    //MARK: - Events
    var didUpdateFavoriteStatus: (() -> Void)?
    
    //MARK: - Actions
    @IBAction private func favoriteAction(_ sender: UIButton) {
        isFavorite.toggle()
        didUpdateFavoriteStatus?()
    }

    //MARK: - Properties
    var title: String = ""{
        didSet{
            textTitle.text = title
        }
    }
    var image: UIImage?{
        didSet{
            imageView.image = image
        }
    }
    var isFavorite: Bool = false{
        didSet{
            let image = isFavorite ? Constants.fillHeartImage : Constants.heartImage
            favoriteButton.setImage(image, for: .normal)
        }
    }
    //MARK: - UICollectionViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
//MARK: - Private Methods
private extension MainItemCollectionViewCell{
    func configAppearance()
    {
        textTitle.textColor = .black
        textTitle.font = .systemFont(ofSize: 12)
        imageView.layer.cornerRadius = 12
        favoriteButton.tintColor = .white
        isFavorite = false
    }
}
