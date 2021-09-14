//
//  HomeView.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 13/09/21.
//

import SwiftUI

struct HomeView: View {
    
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.todos, id: \.id) { todo in
                Text(todo.text)
                    .accentColor(.white)
            }
            .navigationTitle("Things Todo")
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                Image.plusIcon
            }))
        }
        .onAppear {
            viewModel.fetchTodos()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
