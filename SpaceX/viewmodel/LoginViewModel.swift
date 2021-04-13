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
    
    @Published var alertMessage: String = ""
    @Published var alertIsSuccess = true
    
    var isButtonDisable: Bool {
        return email.isEmpty || password.isEmpty
    }
    
    
    // MARK: - FUNCS
    
    func attemptLogin(){
        
        
        repository.login(email: email, password: password) { (result, error) in
            
            if let error = error {
                self.alertMessage = "Error"
                self.alertIsSuccess = false
                print(error)
                
            }
            
            if let result = result{
                
                self.alertMessage = result.message
                self.alertIsSuccess = true
                
                self.result = result
                
            }
  
        }
        
    }
}
