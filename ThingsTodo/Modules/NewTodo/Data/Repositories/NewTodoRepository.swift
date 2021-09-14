//
//  NewTodoRepository.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import Foundation

protocol NewTodoRepository {
    func saveTodo(_ todo: Todo, completion: (NewTodoError?) -> Void)
    func deleteTodo(_ id: UUID, completion: (DeleteTodoError?) -> Void)
}

class NewTodoRepositoryImpl: NewTodoRepository {
    
    private let userDefaultsDataSource: NewTodoUserDefaultsDataSource
    
    init(userDefaultsDataSource: NewTodoUserDefaultsDataSource = NewTodoUserDefaultsDataSourceImpl()) {
        self.userDefaultsDataSource = userDefaultsDataSource
    }
    
    func saveTodo(_ todo: Todo, completion: (NewTodoError?) -> Void) {
        userDefaultsDataSource.saveTodo(todo: todo, completion: completion)
    }
    
    func deleteTodo(_ id: UUID, completion: (DeleteTodoError?) -> Void) {
        userDefaultsDataSource.deleteTodo(id, completion: completion)
    }
}
