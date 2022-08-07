//
//  FavoriteViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import UIKit

class FavoriteViewController: UIViewController {

// MARK: Properties
    private var tableView: UITableView{
        let tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "\(FavoriteTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(FavoriteTableViewCell.self)")
        tableView.backgroundColor = .white
        
        return tableView
    }
    private var presenter: FavoritePresenter = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareAppearence()
        
    }
}
private extension FavoriteViewController{
    func prepareAppearence(){
        view.backgroundColor = .white
        self.title = "Избранное"
        self.view.addSubview(tableView)
    }
}
extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getCountOfFavoriteItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FavoriteTableViewCell.self)", for: indexPath)
        if let correctCell = cell as? FavoriteTableViewCell
        {
            let item = presenter.getItemsWithId(id: indexPath.row)
            correctCell.dateTitle = item.dateTitle
            correctCell.mainTitle = item.mainTitle
            correctCell.underTitle = item.underTitle
            correctCell.image = item.image
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = self.view.frame.width * 1.13
        return height
        
    }
    
}
