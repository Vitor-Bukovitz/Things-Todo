//
//  ThingsTodoApp.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 13/09/21.
//

import SwiftUI

@main
struct ThingsTodoApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
