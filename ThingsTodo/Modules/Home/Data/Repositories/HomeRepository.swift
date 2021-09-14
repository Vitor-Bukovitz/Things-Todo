//
//  HomeRepository.swift
//  ThingsTodo
//
//  Created by PremierSoft on 13/09/21.
//

import Foundation

protocol HomeRepository {
    func fetchTodos(completion: ([Todo]) -> Void)
}

class HomeRepositoryImpl: HomeRepository {
    
    private let homeUserDefaultsDataSource: HomeUserDefaultsDataSource
    
    init(homeUserDefaultsDataSource: HomeUserDefaultsDataSource = HomeUserDefaultsDataSourceImpl()) {
        self.homeUserDefaultsDataSource = homeUserDefaultsDataSource
    }
    
    func fetchTodos(completion: ([Todo]) -> Void) {
        homeUserDefaultsDataSource.fetchTodos(completion: completion)
    }
}
