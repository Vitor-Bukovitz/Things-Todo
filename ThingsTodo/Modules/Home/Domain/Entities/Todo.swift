//
//  Todo.swift
//  ThingsTodo
//
//  Created by PremierSoft on 13/09/21.
//

import Foundation

struct Todo: Codable {
    var id = UUID()
    let text: String
    var isCompleted: Bool = false
}
