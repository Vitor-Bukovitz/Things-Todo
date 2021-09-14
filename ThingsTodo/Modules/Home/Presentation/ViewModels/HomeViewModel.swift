//
//  HomeViewModel.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 13/09/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var todos = [Todo]()
    
    private let fetchTodosUsecase: FetchTodosUsecase
    private let setTodoCompletedUsecase: SetTodoCompletedUsecase
    
    init(fetchTodosUsecase: FetchTodosUsecase = FetchTodosUsecase(),
         setTodoCompletedUsecase: SetTodoCompletedUsecase = SetTodoCompletedUsecase()) {
        self.fetchTodosUsecase = fetchTodosUsecase
        self.setTodoCompletedUsecase = setTodoCompletedUsecase
        self.fetchTodosUsecase.delegate = self
        self.fetchTodos()
    }
    
    func fetchTodos() {
        fetchTodosUsecase.call()
    }
    
    func toggleTodoCompleted(for id: UUID) {
        for (index, todo) in todos.enumerated() {
            if todo.id == id {
                todos[index].isCompleted.toggle()
                setTodoCompletedUsecase.call(todoId: id, completed: todos[index].isCompleted)
            }
        }
    }
}

extension HomeViewModel: FetchTodosUsecaseDelegate {
    
    func fetchTodosSuccess(_ todos: [Todo]) {
        self.todos = todos
        self.isLoading = false
    }
}
