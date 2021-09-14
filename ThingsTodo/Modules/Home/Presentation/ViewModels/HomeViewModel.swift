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
    
    init(fetchTodosUsecase: FetchTodosUsecase = FetchTodosUsecase()) {
        self.fetchTodosUsecase = fetchTodosUsecase
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
            }
        }
    }
}

extension HomeViewModel: FetchTodosUsecaseDelegate {
    
    func fetchTodosSuccess(_ todos: [Todo]) {
        self.todos = [
            Todo(text: "Study SwiftUI"),
            Todo(text: "Study SwiftUI")
        ]
        self.isLoading = false
    }
}
