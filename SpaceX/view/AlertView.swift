//
//  AlertView.swift
//  SpaceX
//
//  Created by Fernando Rauber on 12/04/2021.
//

import SwiftUI

struct AlertView: View {
    
    @Binding var text: String
    @Binding var isSuccess: Bool
    
    @State var showAlert: Bool = false
    @State var timer: Timer?
    
    
    var body: some View {
        
        VStack {
            //only show the error view if the visibleAlert String is not empty:
            if showAlert {
                VStack(alignment: .center) {
                    Spacer()
                    Text(text)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(15)
                }
                .frame( maxWidth: .infinity, maxHeight: 60, alignment: .center)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .shadow(radius: 12)
                .background( isSuccess ? Color.green : Color.red)
                .edgesIgnoringSafeArea(.all)
                .transition(.asymmetric(
                                insertion: AnyTransition.opacity.combined(with: AnyTransition.move(edge: .top)),
                                removal: AnyTransition.opacity
                                    .combined(with: AnyTransition.move(edge: .top)))
                )
            }
            Spacer()
            
            //check the @Binding text property for changes.  if one comes in, set it on our visibleErrorText property
            //then create a timer to make the view disappear in 3 seconds.
        }.onChange(of: text) { newValue in
            withAnimation {
                self.showAlert = (newValue.count > 0)
                self.timer?.invalidate()
                self.timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                    withAnimation {
                        self.showAlert = false
                        self.text = ""
                    }
                }
            }
        }
        
        
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(text: .constant("message for a simple example"), isSuccess: .constant(true))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
