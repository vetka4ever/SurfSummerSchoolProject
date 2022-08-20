//
//  LoginPresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Daniil on 16.08.2022.
//

import Foundation

class LoginPresenter{
    
    init() {
        model.setPresenter = self
    }
    
    // MARK: - Properties
    private var model: LoginModel = .init()
    
    private var view: LoginView? = nil
    
    var setView: LoginView?{
        didSet{
            self.view = setView
        }
    }
    // MARK: - Methods for View
    func logIn(login: String, password: String){

        model.logIn(login: login, password: password)
    }
    
    func getNumberWithCorrectForm(){
        
    }
    
    
    
    // MARK: - Methods for Model
    func updateView(){
        let newView = TabBarConfigurator().configure()
        guard let view = self.view else {return}
        view.goToNextView(view: newView)
    }
    
    func uncorrectLoginOrPassword(){
        if let view = view {
            view.changeNavBarAppearance()
        }
    }
}
