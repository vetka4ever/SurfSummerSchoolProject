//
//  ViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 02.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var findButton: UIBarButtonItem{
        let image = UIImage(systemName: "magnifyingglass")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(rightBarButtonSelector))
        button.tintColor = .black
        return button
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem  = findButton
        self.title = "Главная"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    @objc func rightBarButtonSelector()
    {
        print("Search Button was tapped")
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }


}

