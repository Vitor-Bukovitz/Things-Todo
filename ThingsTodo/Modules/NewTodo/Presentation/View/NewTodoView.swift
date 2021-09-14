//
//  NewTodoView.swift
//  ThingsTodo
//
//  Created by PremierSoft on 14/09/21.
//

import SwiftUI

struct NewTodoView: View {
    
    @State private var viewModel = NewTodoViewModel()
    
    init(todo: Todo? = nil) {
        if let todo = todo {
            viewModel.todoText = todo.text
        }
    }
    
    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Title")
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                TextField("", text: $viewModel.todoText)
                    .padding()
                    .cornerRadius(10)
                    .accentColor(Color.primaryColor)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1)))
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white))
                Spacer()
                Button("Salvar") {
                    print("123")
                }
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(Color.secondaryColor)
                .cornerRadius(8)
                .padding(.bottom, 8)
                Button("Excluir") {
                    
                }
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(Color.redColor)
                .cornerRadius(8)
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
