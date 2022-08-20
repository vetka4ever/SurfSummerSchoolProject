//
//  FavoriteViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    // MARK: - Properties
    
    private var tableView: UITableView{
        let tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName: "\(FavoriteTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(FavoriteTableViewCell.self)")
        tableView.backgroundColor = .white
        
        return tableView
    }
    private var presenter: FavoritePresenter = .init()
    private var models = [ImageResponse]()
    
    
    var accessToModel: [ImageResponse] = [ImageResponse]() {
        didSet{
            self.models = accessToModel
        }
    }
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareAppearence()
        presenter.view = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    // MARK: - Presenter's methods
    
    
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
        var count = models.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FavoriteTableViewCell.self)", for: indexPath)
        cell.selectionStyle = .none
        if let correctCell = cell as? FavoriteTableViewCell{
            let alert = UIAlertController(title: "Внимание", message: "Вы точно хотите удалить из избранного?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "Да, точно ", style: .cancel) { (action) in
                
                self.presenter.removeIdOfFavoritePicture(id: (self.models[indexPath.row].id))
                self.models.remove(at: indexPath.row)
                self.accessToModel.remove(at: indexPath.row)
                self.tableView.reloadData()
                self.viewDidLoad()
                
            }
            let no = UIAlertAction(title: "Нет", style: .default, handler: nil)
            alert.addAction(yes)
            alert.addAction(no)
            
            
            correctCell.dateTitle = models[indexPath.row].dateInCorrectFormat
            correctCell.mainTitle = models[indexPath.row].title
            correctCell.underTitle = models[indexPath.row].content
            correctCell.image = models[indexPath.row].image
            correctCell.buttonIsHidden = false
            correctCell.updateStatus = { [weak self] in
                self?.present(alert, animated: true, completion: nil)
            }
            
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = self.view.frame.width * 1.13
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let i = indexPath.row
        let detailView = DetailItemModel(image: models[i].image,
                                         title: models[i].title,
                                         isFavotire: models[i].isFavotire,
                                         dateCreation: models[i].dateInCorrectFormat,
                                         content: models[i].content)
        let view = DetailViewController()
        view.accessToModel = detailView
        navigationController?.pushViewController(view, animated: true)
    }
    
}
