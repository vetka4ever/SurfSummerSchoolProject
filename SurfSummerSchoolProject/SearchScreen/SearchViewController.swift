//
//  SearchViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 04.08.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Поиск"
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    

}

