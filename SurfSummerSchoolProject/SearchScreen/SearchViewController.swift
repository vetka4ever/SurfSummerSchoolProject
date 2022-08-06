//
//  SearchViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setNavBar()
    }
    
    func setNavBar() {
        navigationItem.title = "Главная"
        navigationController?.navigationBar.tintColor = .black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .plain, target: self, action: #selector(backToMainScreen))
    }
    
    
    @objc func backToMainScreen(){
        navigationController?.popViewController(animated: true)
    }

}

