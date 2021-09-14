//
//  HomeUserDefaultsDataSource.swift
//  ThingsTodo
//
//  Created by PremierSoft on 13/09/21.
//

import Foundation

protocol HomeUserDefaultsDataSource {
    func fetchTodos(completion: ([Todo]) -> Void)
}

class HomeUserDefaultsDataSourceImpl: HomeUserDefaultsDataSource {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func fetchTodos(completion: ([Todo]) -> Void) {
        userDefaults.array(forKey: "")
    }
}
