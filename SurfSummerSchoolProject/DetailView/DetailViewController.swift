//
//  DetailViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 07.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: -  Properties
    private var model = DetailItemModel(image: nil, title: "", isFavotire: false, dateCreation: "", content: "")
    private var tableView: UITableView{
        let tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.register(UINib(nibName: "\(FavoriteTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(FavoriteTableViewCell.self)")
        return tableView
    }
    // MARK: - Access to properties
    var accessToModel = DetailItemModel(image: nil, title: "", isFavotire: false, dateCreation: "", content: ""){
        didSet{
            model = accessToModel
        }
    }
    
    // MARK: - Methods
    private func prepareAppearance(){
        view.backgroundColor = .white
        self.view.addSubview(tableView)
        navigationController?.navigationBar.tintColor = .black
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .plain, target: self, action: #selector(backToMainScreen))
    }
    @objc func backToMainScreen(){
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareAppearance()
       
    }

}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FavoriteTableViewCell.self)", for: indexPath)
        if let correctCell = cell as? FavoriteTableViewCell{
            correctCell.image = model.image
            correctCell.dateTitle = model.dateCreation
            correctCell.mainTitle = model.title
            correctCell.underTitle = model.content
            correctCell.countOfLines = 0
            self.title = model.title
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width: CGFloat = tableView.frame.width * 1.54
        return width
    }
    
}
