//
//  ViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 02.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Constants
    private enum Constants{
        static let horisontalInset: CGFloat = 16
        static let spaceBetweenElements: CGFloat = 7
        static let spaceBetweenRows: CGFloat = 8
    }
    // MARK: - Private properties
    private var findButton: UIBarButtonItem{
        let image = UIImage(systemName: "magnifyingglass")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(rightBarButtonSelector))
        button.tintColor = .black
        return button
    }
    private let presenter: MainPresenter = .init()
    
    
    // MARK: - UIViews
    private var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: .init())
    
    // MARK: - UIViewController
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setAppearance()
        setCollectionView()
    }
    
    //MARK: - Selectors
    
    @objc func rightBarButtonSelector()
    {
        print("Search Button was tapped")
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
}
private extension MainViewController{
    func setAppearance(){
        navigationItem.rightBarButtonItem  = findButton
        self.title = "Главная"
        view.backgroundColor = .white
    }
    
    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "\(MainItemCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(MainItemCollectionViewCell.self)")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16 )
        
        
        self.view.addSubview(collectionView)
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getCountOfItems()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainItemCollectionViewCell.self)", for: indexPath)
        if let newCell = cell as? MainItemCollectionViewCell
        {
            let item = presenter.getItem(id: indexPath.row)
            newCell.title = item.title
            newCell.image = item.image
            newCell.isFavorite = item.isFavotire
            newCell.didUpdateFavoriteStatus = { [weak self] in
                self?.presenter.updateFavoriteStatus(id: indexPath.row)
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - Constants.horisontalInset * 2 - Constants.spaceBetweenRows) / 2
        return CGSize(width: itemWidth, height: itemWidth * 1.46)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElements
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRows
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
