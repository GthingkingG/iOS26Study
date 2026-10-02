//
//  CategoryDetailView.swift
//  Week10_Concepts
//
//  Created by One on 5/31/26.
//

import SwiftUI
import SwiftData

struct CategoryDetailView: View {
    let category: Category
    
    @Query private var todos: [Todo]
    
    init(category: Category) {
        self.category = category
        let categoryID = category.persistentModelID
        _todos = Query(
            filter: #Predicate<Todo> { $0.category?.persistentModelID == categoryID },
            sort: \.createdAt
        )
    }
    
    var body: some View {
        List(todos) { todo in
            Text(todo.title)
        }
        .navigationTitle(category.name)
    }
}
