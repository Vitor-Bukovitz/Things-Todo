//
//  DeleteTodoError.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import Foundation

enum DeleteTodoError {
    case unableToDelete
}

extension DeleteTodoError {
    
    var title: String {
        switch self {
        case .unableToDelete:
            return "Unable to delete"
        }
    }
    
    var message: String {
        switch self {
        case .unableToDelete:
            return "Something went wrong and it was not able to delete your todo. Try again later."
        }
    }
}
