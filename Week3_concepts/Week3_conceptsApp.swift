//
//  Week3_conceptsApp.swift
//  Week3_concepts
//
//  Created by One on 3/4/26.
//

import SwiftUI

@main
struct Week3_conceptsApp: App {
    private let container = DIContainer.makeAppContainer()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                UserScreen(viewModel: container.resolve(UserViewModel.self))
            }
        }
    }
}
