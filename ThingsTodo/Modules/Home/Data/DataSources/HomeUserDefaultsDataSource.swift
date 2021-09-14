//
//  HomeUserDefaultsDataSource.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 13/09/21.
//

import Foundation

protocol HomeUserDefaultsDataSource {
    func fetchTodos(completion: ([Todo]) -> Void)
    func setCompleted(todoId: UUID, completed: Bool)
}

class HomeUserDefaultsDataSourceImpl: HomeUserDefaultsDataSource {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func fetchTodos(completion: ([Todo]) -> Void) {
        let decoder = JSONDecoder()
        guard let data = userDefaults.value(forKey: UserDefaultsConstants.todosArray) as? Data,
              let todosArray = try? decoder.decode([Todo].self, from: data) else {
            return completion([])
        }
        completion(todosArray)
    }
    
    func setCompleted(todoId: UUID, completed: Bool) {
        fetchTodos { todos in
            var todos = todos
            if let index = todos.firstIndex(where: { $0.id == todoId }) {
                let encoder = JSONEncoder()
                todos[index].isCompleted = completed
                guard let data = try? encoder.encode(todos) else { return }
                userDefaults.setValue(data, forKey: UserDefaultsConstants.todosArray)
            }
        }
    }
}
