//
//  LoginViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 15.08.2022.
//

import UIKit

class LoginView: UIViewController {
    // MARK: - Properties
    
    private var loginTextField: UITextField = .init()
    private var passwordTextField: UITextField = .init()
    private var enterButton: UIButton = .init()
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAppearance()
        
    }
    

    

}
extension LoginView{
    
    func setAppearance(){
        view.backgroundColor = .white
        title = "Вход"
        setTextFields()
        setEnterButton()
    }
    
    func setTextFields(){
        [loginTextField, passwordTextField].forEach { [weak self] field in
            guard let rightSelf = self else {return}
            // set size
            let height = rightSelf.view.frame.height * 0.067
            let width = height * 6.23
            field.frame.size = CGSize(width: width, height: height)
            // set origin
            let yRatio = rightSelf.view.frame.height * 0.14
            field.center.x = rightSelf.view.center.x
            field.center.y = rightSelf.view.frame.height * (field == loginTextField ?  (115/812) : (187/812))
            
            field.placeholder = (field == loginTextField ?  ("    Логин") : ("    Пароль"))
            field.backgroundColor = UIColor(red: 251/256, green: 251/256, blue: 251/256, alpha: 1)
            
            rightSelf.view.addSubview(field)
        }
    }
    
    func setEnterButton(){
        // set size
        let height = self.view.frame.height * 0.059
        let width = height * 7.14
        enterButton.frame.size = CGSize(width: width, height: height)
        // set origin
        enterButton.center.x = self.view.center.x
        enterButton.center.y = self.view.frame.height * 0.33
        
        enterButton.setTitle("Войти", for: .normal)
        enterButton.backgroundColor = .black
        
        self.view.addSubview(enterButton)
    }
}
