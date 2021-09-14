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
    
    func fetchTodos(completion: ([Todo]) -> Void) {
        
    }
}
