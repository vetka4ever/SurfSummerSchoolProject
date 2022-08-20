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
    private var presenter: LoginPresenter = .init()
    private var imageView = UIImageView(image: UIImage(named: "SURF EDU login"))
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
    }
    
    var isDark = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDark ? .lightContent : .darkContent
    }
    
    
    // MARK: - Presenter's Methods
    func goToNextView(view: UITabBarController){
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    
    func changeNavBarAppearance(){
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor(red: 0.953, green: 0.345, blue: 0.345, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 0.976, green: 0.98, blue: 1, alpha: 1)]
        title = "Логин или пароль введен неправильно"
        navigationItem.scrollEdgeAppearance = appearance
        isDark.toggle()
    }
}



private extension LoginView{
    
    func setAppearance(){
        
        view.backgroundColor = .white
        title = "Вход"
        presenter.setView = self
        setTextFields()
        setEnterButton()
        setImage()
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
            field.textColor = .black
            
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
        enterButton.addTarget(self, action: #selector(enterButtonAction(_:)), for: .touchDown)
        self.view.addSubview(enterButton)
    }
    
    func setImage(){
        let width = self.view.frame.width * 0.42
        let height = width * 1.5
        imageView.frame.size = CGSize(width: width, height: height)
        imageView.frame.origin.x = 0
        imageView.frame.origin.y = self.view.frame.height * 0.487
        
        self.view.addSubview(imageView)
        
    }
    
    @objc func enterButtonAction(_: UIButton){
        guard let login = loginTextField.text, let password = passwordTextField.text else {return}
        presenter.logIn(login: login, password: password )
    }
}
