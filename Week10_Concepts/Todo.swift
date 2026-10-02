//
//  Todo.swift
//  Week10_Concepts
//
//  Created by One on 5/31/26.
//

import Foundation
import SwiftData

@Model
final class Todo {
    var title: String = ""
    var isDone: Bool = false
    var createdAt: Date = Date.now
    var category: Category?
    
    init(title: String = "", isDone: Bool = false, category: Category? = nil) {
        self.title = title
        self.isDone = isDone
        self.createdAt = .now
        self.category = category
    }
}
