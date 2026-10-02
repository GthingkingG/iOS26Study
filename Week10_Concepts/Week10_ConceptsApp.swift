//
//  Week10_ConceptsApp.swift
//  Week10_Concepts
//
//  Created by One on 5/31/26.
//

import SwiftUI
import SwiftData

@main
struct Week10_ConceptsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Todo.self, Category.self])
        
        let configuration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            cloudKitDatabase: .automatic
        )
        
        do {
            return try ModelContainer(for: schema, configurations: [configuration])
        } catch {
            fatalError("ModelContainer 생성 실패: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
