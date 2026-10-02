//
//  ContentView.swift
//  Week10_Concepts
//
//  Created by One on 5/31/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var todos: [Todo]
    
    @State private var newTitle = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in
                    HStack {
                        Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                todo.isDone.toggle()
                            }
                        Text(todo.title)
                    }
                }
                .onDelete(perform: deleteTodos)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("추가") { addTodo() }
                }
            }
            .safeAreaInset(edge: .bottom) {
                TextField("새 할 일", text: $newTitle)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
        }
    }
    
    private func addTodo() {
        guard !newTitle.isEmpty else { return }
        let todo = Todo(title: newTitle)
        context.insert(todo)
        newTitle = ""
    }
    
    private func deleteTodos(at offsets: IndexSet) {
        for index in offsets {
            context.delete(todos[index])
        }
    }
}

#Preview {
    ContentView()
}
