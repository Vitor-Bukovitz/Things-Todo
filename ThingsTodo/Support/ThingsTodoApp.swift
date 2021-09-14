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
        UITableView.appearance().backgroundColor = UIColor(cgColor: Color.primaryColor.cgColor!)
        UINavigationBar.appearance().barTintColor = UIColor(cgColor: Color.primaryColor.cgColor!)
        UINavigationBar.appearance().backgroundColor = UIColor(cgColor: Color.primaryColor.cgColor!)
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
