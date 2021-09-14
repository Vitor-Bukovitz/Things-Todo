//
//  NewTodoView.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import SwiftUI

struct NewTodoView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel = NewTodoViewModel()
    
    private var todo: Todo?
        
    init(todo: Todo? = nil) {
        self.todo = todo
    }
    
    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Title")
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                TDTextField(text: $viewModel.todoText)
                Spacer()
                TDButton(text: "Salvar", backgroundColor: .secondaryColor) {
                    viewModel.saveTodo()
                }
                .padding(.bottom, 8)
                .alert(isPresented: $viewModel.isShowingErrorAlert) {
                    Alert(
                        title: Text(viewModel.errorAlertTitle),
                        message: Text(viewModel.errorAlertMessage),
                        dismissButton: .cancel(Text("Ok"), action: {
                            presentationMode.wrappedValue.dismiss()
                        })
                    )
                }
                if let todo = todo {
                    TDButton(text: "Excluir", backgroundColor: .redColor) {
                        viewModel.isShowingDeleteAlert = true
                    }
                    .alert(isPresented: $viewModel.isShowingDeleteAlert) {
                        Alert(
                            title: Text("Delete?"),
                            message: Text("Are you sure you want to delete this to do?"),
                            primaryButton: .default(Text("Cancel")),
                            secondaryButton: .destructive(Text("Delete"), action: {
                                viewModel.deleteTodo(todo)
                            })
                        )
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.setTodo(todo)
        }
        .navigationBarTitle("New Todo", displayMode: .inline)
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView()
    }
}
