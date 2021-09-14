//
//  DeleteTodoUsecase.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import Foundation

protocol DeleteTodoUsecaseDelegate: AnyObject {
    func deleteTodoFailure(_ error: DeleteTodoError)
    func deleteTodoSuccess()
}

class DeleteTodoUsecase {
    
    private let repository: NewTodoRepository
    
    weak var delegate: DeleteTodoUsecaseDelegate?
    
    init(repository: NewTodoRepository = NewTodoRepositoryImpl()) {
        self.repository = repository
    }
    
    func call(id: UUID) {
        repository.deleteTodo(id) { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                guard let error = error else {
                    self.delegate?.deleteTodoSuccess()
                    return
                }
                self.delegate?.deleteTodoFailure(error)
            }
            
        }
    }
}

