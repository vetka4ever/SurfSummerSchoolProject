//
//  ProfileViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    //MARK: - Properties
    private var tableView: UITableView{
        let tableView = UITableView(frame: CGRect(x: self.view.frame.origin.x,
                                                  y: self.view.frame.origin.y,
                                                  width: self.view.frame.width,
                                                  height: self.view.frame.height * 0.57),
                                    style: .grouped)
        tableView.backgroundColor = .white
        tableView.register(UINib(nibName: "\(ProfileWithImageTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(ProfileWithImageTableViewCell.self)")
        tableView.register(UINib(nibName: "\(ProfileWithTitlesTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(ProfileWithTitlesTableViewCell.self)")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        
        return tableView
    }
    private let presenter: ProfilePresenter = .init()
    private var alertController: UIAlertController{
        let alert = UIAlertController(title: "Внимание", message: "Вы точно хотите выйти из приложения?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Да, точно", style: .cancel) { [self] action in
            presenter.deleteAllDataOfUser()
        }
        let no = UIAlertAction(title: "Нет", style: .default, handler: nil)
        alert.addAction(no)
        alert.addAction(yes)
        
        
        
        return alert
    }
    private var exitButton: UIButton{
        let button = UIButton()
        button.frame.size = CGSize(width: self.view.frame.width * 0.91,
                                   height: self.view.frame.height * 0.05)
        button.center.x = view.center.x
        button.frame.origin.y = view.frame.height * 0.809
        button.setTitle("Выйти", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(exitButtonAction(_:)), for: .touchDown)
        return button
    }
    
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        
    }
    
    @objc func exitButtonAction(_: UIButton){
        present(alertController, animated: true, completion: nil)
        
    }
    
    //MARK: - Methods For Presenter
    func goToLoginView(navigationController: UINavigationController){
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
}
//MARK: - TableView Methods
extension ProfileViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let res = presenter.countOfCells
        print(res)
        return res
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileWithImageTableViewCell.self)", for: indexPath)
            guard let saveCell = cell as? ProfileWithImageTableViewCell else {return UITableViewCell()}
            if let info = presenter.getInfoForCell(typeInfo: indexPath.row) as? ProfileWithImageModel{
                saveCell.nameTitle = info.nameTitle
                saveCell.smartMindTitle = info.smartMindTitle
                saveCell.image = info.viewImage
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileWithTitlesTableViewCell.self)", for: indexPath)
            guard let saveCell = cell as? ProfileWithTitlesTableViewCell else {return UITableViewCell()}
            if let info = presenter.getInfoForCell(typeInfo: indexPath.row) as? ProfileWithTitlesModel{
                saveCell.bigTitle = info.bigTitleLabel
                saveCell.smallTitle = info.smallTitleLabel
            }
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = self.view.frame.height
        return (indexPath.row == 0 ? (height * 0.15) : (height * 0.08))
        
    }
}

//MARK: - Private Methods
private extension ProfileViewController{
    func setAppearance(){
        view.backgroundColor = .white
        self.title = "Профиль"
        presenter.setView = self
        self.view.addSubview(tableView)
        self.view.addSubview(exitButton)
    }
}

