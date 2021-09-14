//
//  FetchTodosUsecase.swift
//  ThingsTodo
//
//  Created by PremierSoft on 13/09/21.
//

import Foundation

class FetchTodosUsecase {
    
    private let repository: HomeRepository
    
    init(repository: HomeRepository = HomeRepositoryImpl()) {
        self.repository = repository
    }
    
    func call() {
        
    }
}
