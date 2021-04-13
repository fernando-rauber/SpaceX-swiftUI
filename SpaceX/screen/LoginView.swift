//
//  LoginView.swift
//  SpaceX
//
//  Created by Fernando Rauber on 11/04/2021.
//

import SwiftUI

struct LoginView: View {
    // MARK: - PROPERTIES
    
    @ObservedObject var viewmodel = LoginViewModel()
    
    @State private var showAlert = false
     
    
    // MARK: - BODY
    var body: some View {
        
        ZStack(alignment: .top){
            
            if viewmodel.result != nil {
                AlertView(message: viewmodel.result?.message ?? "", isErrorMessage: false)
                    .edgesIgnoringSafeArea(.all)
//                    .onAppear{
//                        withAnimation(.easeIn(duration: 5)){
//                            viewmodel.result = nil
//                        }
//                    }
            }
            
            VStack{
                
                Text("SpaceX")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .padding(.top, 50)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text("Login")
                    
                    TextField("", text: $viewmodel.email)
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 2))
                        .background(Color.white)
                        .cornerRadius(12)
                    
                    Text("Password")
                        .padding(.top, 10)
                    
                    SecureField("", text: $viewmodel.password)
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 2))
                        .background(Color.white)
                        .cornerRadius(12)
                }// :VStack
                
                Spacer()
                
                VStack {
                    Button(action: {
                        viewmodel.attemptLogin()
                    }){
                        Text("Login")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            
                    
                    }// : Button
                    .padding()
                    .background( Color.blue)
                    .disabled(viewmodel.isButtonDisable)
                    .opacity(viewmodel.isButtonDisable ? 0.6 : 1.0)
                    .cornerRadius(10)
                    
                    
                    
                    Button(action: {
                        
                        
                    }) {

                        Text("Forgot Password")
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                        
                    }// :Button
                    .padding()
                    .foregroundColor(.blue)

                    
                }// :VStack
                
            }// :VStack
            .padding(37)
            .background(Color.gray.opacity(0.1))
            .edgesIgnoringSafeArea(.all)
//            .alert(isPresented: .constant(viewmodel.result != nil)) {
//                Alert(
//                    title: Text(viewmodel.result?.title ?? ""),
//                    message: Text(viewmodel.result?.message ?? ""),
//                    dismissButton: .default(Text("OK")))
//            }
            
            
        }// :ZStack
        
        
    }
}

// MARK: - PREVIEW
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 12")
    }
}
