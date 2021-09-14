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
                            NavigationLink(destination: NewTodoView(todo: todo)) {
                                HStack {
                                    Text(todo.text)
                                        .accentColor(.white)
                                    Spacer()
                                    ZStack {
                                        if todo.isCompleted {
                                            Image.checkedBoxIcon
                                        } else {
                                            Image.emptyBoxIcon
                                        }
                                    }
                                    .frame(width: 24, height: 24)
                                    .onTapGesture {
                                        viewModel.toggleTodoCompleted(for: todo.id)
                                    }
                                }
                                .contentShape(Rectangle())
                                .frame(height: 34)
                            }
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
                .onAppear {
                    viewModel.fetchTodos()
                }
                .navigationTitle("Things Todo")
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarItems(trailing: NavigationLink(destination: NewTodoView(), label: {
                    Image.plusIcon
                }))
            }
            .accentColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
