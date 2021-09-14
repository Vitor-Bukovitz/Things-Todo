//
//  NewTodoUserDefaultsDataSource.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import Foundation

protocol NewTodoUserDefaultsDataSource {
    func saveTodo(todo: Todo, completion: (NewTodoError?) -> Void)
    func deleteTodo(_ id: UUID, completion: (DeleteTodoError?) -> Void)
}

class NewTodoUserDefaultsDataSourceImpl: NewTodoUserDefaultsDataSource {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func saveTodo(todo: Todo, completion: (NewTodoError?) -> Void) {
        let encoder = JSONEncoder()
        getTodos { todos in
            var todos = todos
            if let index = todos.firstIndex(where: { $0.id == todo.id }) {
                todos[index] = todo
            } else {
                todos.append(todo)
            }
            guard let data = try? encoder.encode(todos) else { return completion(.unableToSave) }
            userDefaults.setValue(data, forKey: UserDefaultsConstants.todosArray)
            completion(nil)
        }
    }
    
    func deleteTodo(_ id: UUID, completion: (DeleteTodoError?) -> Void) {
        let encoder = JSONEncoder()
        getTodos { todos in
            var todos = todos
            guard let index = todos.firstIndex(where: { $0.id == id }) else {
                completion(.unableToDelete)
                return
            }
            todos.remove(at: index)
            guard let data = try? encoder.encode(todos) else {
                completion(.unableToDelete)
                return
            }
            userDefaults.setValue(data, forKey: UserDefaultsConstants.todosArray)
            completion(nil)
        }
    }
    
    private func getTodos(completion: ([Todo]) -> Void) {
        let decoder = JSONDecoder()
        guard let data = userDefaults.value(forKey: UserDefaultsConstants.todosArray) as? Data,
              let todos = try? decoder.decode([Todo].self, from: data) else {
            return completion([])
        }
        completion(todos)
    }
}
