//
//  NewTodoViewModel.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import Foundation

class NewTodoViewModel: ObservableObject {
    
    @Published var isShowingDeleteAlert = false
    @Published var isShowingErrorAlert = false
    @Published var todoText: String = ""
    
    var errorAlertTitle = ""
    var errorAlertMessage = ""
    var isNewTodo = true
    
    private var todo: Todo?
    private let saveNewTodoUsecase: SaveNewTodoUsecase
    private let deleteTodoUsecase: DeleteTodoUsecase
    
    init(saveNewTodoUsecase: SaveNewTodoUsecase = SaveNewTodoUsecase(),
         deleteTodoUsecase: DeleteTodoUsecase = DeleteTodoUsecase()) {
        self.saveNewTodoUsecase = saveNewTodoUsecase
        self.deleteTodoUsecase = deleteTodoUsecase
        self.saveNewTodoUsecase.delegate = self
        self.deleteTodoUsecase.delegate = self
    }
    
    func saveTodo() {
        let todo = Todo(
            id: self.todo?.id ?? UUID(),
            text: todoText,
            isCompleted: self.todo?.isCompleted ?? false
        )
        saveNewTodoUsecase.call(todo: todo)
    }
    
    func setTodo(_ todo: Todo?) {
        guard let todo = todo else { return }
        self.todo = todo
        self.todoText = todo.text
        self.isNewTodo = false
    }
    
    func deleteTodo(_ todo: Todo) {
        deleteTodoUsecase.call(id: todo.id)
    }
}

extension NewTodoViewModel: SaveNewTodoUsecaseDelegate {
    
    func saveNewTodoFailure(_ error: NewTodoError) {
        errorAlertTitle = error.title
        errorAlertMessage = error.message
        isShowingErrorAlert = true
    }
    
    func saveNewTodoSuccess() {
        errorAlertTitle = "Success!"
        errorAlertMessage = "Your to do was successfully saved 🎉"
        isShowingErrorAlert = true
    }
}

extension NewTodoViewModel: DeleteTodoUsecaseDelegate {
    
    func deleteTodoFailure(_ error: DeleteTodoError) {
        errorAlertTitle = error.title
        errorAlertMessage = error.message
        isShowingErrorAlert = true
    }
    
    func deleteTodoSuccess() {
        errorAlertTitle = "Deleted"
        errorAlertMessage = "Your to do was successfully deleted 🎉"
        isShowingErrorAlert = true
    }
}
