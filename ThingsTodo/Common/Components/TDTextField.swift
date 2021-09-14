//
//  TDTextField.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import SwiftUI

struct TDTextField: View {
    
    let text: Binding<String>
    
    var body: some View {
        TextField("", text: text)
            .padding()
            .cornerRadius(10)
            .accentColor(Color.primaryColor)
            .overlay(RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1)))
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white))
    }
}

struct TDTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        TDTextField(text: .init(get: {
            ""
        }, set: { _ in
            
        }))
    }
}
