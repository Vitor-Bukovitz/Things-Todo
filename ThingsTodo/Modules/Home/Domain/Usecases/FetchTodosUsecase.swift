//
//  FetchTodosUsecase.swift
//  ThingsTodo
//
//  Created by PremierSoft on 13/09/21.
//

import Foundation

protocol FetchTodosUsecaseDelegate: AnyObject {
    func fetchTodosSuccess(_ todos: [Todo])
}

class FetchTodosUsecase {
    
    private let repository: HomeRepository
    
    weak var delegate: FetchTodosUsecaseDelegate?
    
    init(repository: HomeRepository = HomeRepositoryImpl()) {
        self.repository = repository
    }
    
    func call() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.repository.fetchTodos { todos in
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.delegate?.fetchTodosSuccess(todos)
                }
            }
        }
//        repository.fetchTodos { [weak self] todos in
//            guard let self = self else { return }
//            self.delegate?.fetchTodosSuccess(todos)
//        }
    }
}
