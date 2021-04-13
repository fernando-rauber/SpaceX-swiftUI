//
//  LoginRepository.swift
//  SpaceX
//
//  Created by Fernando Rauber on 11/04/2021.
//

var apiURL = URL(string: "https://api.mockaroo.com/api/6fa82ca0?count=1&key=89421320")!

import SwiftUI

class LoginRepository {
    

    func login(email: String, password: String, completionHandler: @escaping (LoginResponse?, Error?) -> Void){
        
        
        URLSession.shared.dataTask(with: apiURL) { (data, response, err) in
            
            if err != nil{
                completionHandler(nil, err)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else {return}
                
                DispatchQueue.main.async {
                    do{
                        let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                        completionHandler(loginResponse, nil)
                        
                    } catch let err {
                        completionHandler(nil, err)
                    }
                }
            }else{
                completionHandler( LoginResponse(title: "Error", message: "Deu errado", code: 400, token: ""), nil)
            }
            
            
        }.resume()
        
    }
    
}
