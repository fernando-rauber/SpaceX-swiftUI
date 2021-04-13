//
//  View+Extension.swift
//  SpaceX
//
//  Created by Fernando Rauber on 13/04/2021.
//

import SwiftUI

extension View {
    func errorView(text: Binding<String>, isSuccess: Binding<Bool>) -> some View {
        self.modifier(AlertMessageViewModifier(text: text, isSuccess: isSuccess))
    }
}
