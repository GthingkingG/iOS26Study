//
//  Category.swift
//  Week10_Concepts
//
//  Created by One on 5/31/26.
//

import Foundation
import SwiftData

@Model
final class Category {
    var name: String = ""
    @Relationship(deleteRule: .cascade, inverse: \Todo.category)
    var todos: [Todo]? = []
    
    init(name: String = "") {
        self.name = name
    }
}
