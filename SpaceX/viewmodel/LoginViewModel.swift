//
//  LoginViewModel.swift
//  SpaceX
//
//  Created by Fernando Rauber on 11/04/2021.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    // MARK: - PROPERTY
    
    private let repository = LoginRepository()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var result: LoginResponse? = nil
    
    
    var isButtonDisable: Bool {
        return email.isEmpty || password.isEmpty
    }
    
    
    // MARK: - FUNCS
    
    func attemptLogin(){
        
        
        repository.login(email: email, password: password) { (result, error) in
            
            if let error = error {
                print(error)
            }
            
            if let result = result{
                
                self.result = result
                
            }
  
        }
        
    }
}
