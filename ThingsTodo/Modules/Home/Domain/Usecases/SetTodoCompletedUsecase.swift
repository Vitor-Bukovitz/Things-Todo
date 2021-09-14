//
//  SetTodoCompletedUsecase.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import Foundation

class SetTodoCompletedUsecase {
    
    private let repository: HomeRepository
    
    init(repository: HomeRepository = HomeRepositoryImpl()) {
        self.repository = repository
    }
    
    func call(todoId: UUID, completed: Bool) {
        repository.setCompleted(todoId: todoId, completed: completed)
    }
}
