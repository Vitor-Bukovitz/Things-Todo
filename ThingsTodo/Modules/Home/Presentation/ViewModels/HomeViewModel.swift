//
//  HomeViewModel.swift
//  ThingsTodo
//
//  Created by PremierSoft on 13/09/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var todos = [Todo]()
    
    private let fetchTodosUsecase: FetchTodosUsecase
    
    init(fetchTodosUsecase: FetchTodosUsecase = FetchTodosUsecase()) {
        self.fetchTodosUsecase = fetchTodosUsecase
    }
    
    func fetchTodos() {
        isLoading = false
        todos = [
            Todo(text: "Study SwiftUI", isCompleted: false),
            Todo(text: "Wash the dishes", isCompleted: false),
            Todo(text: "Wash the dishes", isCompleted: false)
        ]
    }
}
