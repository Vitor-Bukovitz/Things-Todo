//
//  HomeRepository.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 13/09/21.
//

import Foundation

protocol HomeRepository: AnyObject {
    func fetchTodos(completion: ([Todo]) -> Void)
    func setCompleted(todoId: UUID, completed: Bool)
}

class HomeRepositoryImpl: HomeRepository {
    
    private let userDefaultsDataSource: HomeUserDefaultsDataSource
    
    init(userDefaultsDataSource: HomeUserDefaultsDataSource = HomeUserDefaultsDataSourceImpl()) {
        self.userDefaultsDataSource = userDefaultsDataSource
    }
    
    func fetchTodos(completion: ([Todo]) -> Void) {
        userDefaultsDataSource.fetchTodos(completion: completion)
    }
    
    func setCompleted(todoId: UUID, completed: Bool) {
        userDefaultsDataSource.setCompleted(todoId: todoId, completed: completed)
    }
}
