//
//  HomeView.swift
//  ThingsTodo
//
//  Created by Vitor Bukovitz on 13/09/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        if (viewModel.isLoading) {
            ZStack {
                Color.primaryColor
                    .ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
            }
        } else {
            NavigationView {
                ZStack {
                    Color.primaryColor
                        .ignoresSafeArea()
                    if (!viewModel.todos.isEmpty) {
                        List(viewModel.todos, id: \.id) { todo in
                            Text(todo.text)
                                .accentColor(.white)
                        }
                    } else {
                        VStack {
                            Spacer()
                            Image.emptyIcon
                                .padding(.bottom, 12)
                            Text("None found")
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                }
                .navigationTitle("Things Todo")
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarItems(trailing: NavigationLink(destination: HomeView(), label: {
                    Image.plusIcon
                }))
            }
            .onAppear {
                viewModel.fetchTodos()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
