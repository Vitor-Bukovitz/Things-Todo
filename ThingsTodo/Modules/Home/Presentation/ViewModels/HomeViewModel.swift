//
//  HomeViewModel.swift
//  ThingsTodo
//
//  Created by PremierSoft on 13/09/21.
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
}

extension HomeViewModel: FetchTodosUsecaseDelegate {
    
    func fetchTodosSuccess(_ todos: [Todo]) {
        self.todos = todos
        self.isLoading = false
    }
}
