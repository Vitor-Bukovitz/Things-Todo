//
//  SaveNewTodoUsecase.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import Foundation

protocol SaveNewTodoUsecaseDelegate: AnyObject {
    func saveNewTodoFailure(_ error: NewTodoError)
    func saveNewTodoSuccess()
}

class SaveNewTodoUsecase {
    
    private let repository: NewTodoRepository
    
    weak var delegate: SaveNewTodoUsecaseDelegate?
    
    init(repository: NewTodoRepository = NewTodoRepositoryImpl()) {
        self.repository = repository
    }
    
    func call(todo: Todo) {
        guard !todo.text.isEmpty else {
            delegate?.saveNewTodoFailure(.emptyText)
            return
        }
        repository.saveTodo(todo) { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                guard let error = error else {
                    self.delegate?.saveNewTodoSuccess()
                    return
                }
                self.delegate?.saveNewTodoFailure(error)
            }
        }
    }
}
