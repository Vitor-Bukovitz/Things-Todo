//
//  NewTodoView.swift
//  ThingsTodo
//
//  Created by PremierSoft on 14/09/21.
//

import SwiftUI

struct NewTodoView: View {
    
    @State var text: String = ""
    
    init(todo: Todo? = nil) {
    }
    
    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Title")
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                TextField("", text: $text)
                    .padding()
                    .cornerRadius(10)
                    .accentColor(Color.primaryColor)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1)))
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white))
                Spacer()
                
                Button("Excluir") {
                    print("123")
                }
                Button("Salvar") {
                    print("123")
                }
            }
            .padding()
        }
        .navigationBarTitle("New Todo", displayMode: .inline)
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView()
    }
}
