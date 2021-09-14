//
//  TDButton.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import SwiftUI

struct TDButton: View {
    
    var text: String
    var backgroundColor: Color
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(text)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(backgroundColor)
                .cornerRadius(8)
        }
    }
}

struct TDButton_Previews: PreviewProvider {
    static var previews: some View {
        TDButton(text: "Excluir", backgroundColor: .accentColor)
    }
}
