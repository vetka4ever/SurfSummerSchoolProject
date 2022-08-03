//
//  ViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 02.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
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
        self.title = "Navigation title"
    }
    
    @objc func rightBarButtonSelector()
    {
        print("Search Button was tapped ")
    }


}

