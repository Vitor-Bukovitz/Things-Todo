//
//  NewTodoError.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import Foundation

enum NewTodoError {
    case unableToSave
    case emptyText
}

extension NewTodoError {
    
    var title: String {
        switch self {
        case .unableToSave:
            return "Unable to save"
        case .emptyText:
            return "Empty text"
        }
    }
    
    var message: String {
        switch self {
        case .unableToSave:
            return "Something went wrong and it was not able to save your todo. Try again later."
        case .emptyText:
            return "The title of your to do cannot be empty."
        }
    }
}

