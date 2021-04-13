//
//  AlertMessageModifier.swift
//  SpaceX
//
//  Created by Fernando Rauber on 13/04/2021.
//

import SwiftUI


struct AlertMessageViewModifier: ViewModifier {
    
    @Binding var text: String
    @Binding var isSuccess: Bool
    func body(content: Content) -> some View {
        ZStack {
            content
            AlertView(text: $text, isSuccess: $isSuccess)
        }
    }
}
