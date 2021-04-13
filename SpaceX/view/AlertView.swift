//
//  AlertView.swift
//  SpaceX
//
//  Created by Fernando Rauber on 12/04/2021.
//

import SwiftUI

struct AlertView: View {
    
    @State private var isAnimated = false
    
    var message: String
    var isErrorMessage: Bool
    
    var body: some View {
        
        VStack {
            Text(message)
                .padding(.top, 40)
        }
        .frame( maxWidth: .infinity, maxHeight: 100, alignment: .center)
        .background(isErrorMessage ? Color.red : Color.green)
        .offset(x: 0, y: isAnimated ? 0 : -100)
       
        .onAppear(perform: {
            withAnimation(Animation.linear(duration: 1)){
                isAnimated.toggle()
            }
            
//            withAnimation(Animation.linear(duration: 1).delay(5)){
//                print("dddddd")
//                isAnimated.toggle()
//            }
//            withAnimation(Animation.easeIn.delay(5).speed(2)){
//                print("dddddd")
//                isAnimated.toggle()
//            }
        })
        
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(message: "Hello, World!", isErrorMessage: false)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
