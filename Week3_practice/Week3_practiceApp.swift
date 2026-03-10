//
//  Week3_practiceApp.swift
//  Week3_practice
//
//  Created by One on 3/4/26.
//

import SwiftUI

extension DIContainer {
    static func makeAppContainer() -> DIContainer {
        let container = DIContainer()
        
        container.register(UserRemoteDataSource.self, scope: .singleton) { _ in
            UserRemoteDataSourceImpl()
        }
        
        container.register(UserRepository.self, scope: .singleton) { resolver in
            UserRepositoryImpl(remote: resolver.resolve(UserRemoteDataSource.self))
        }
        
        container.register(FetchUserUseCase.self) { resolver in
            FetchUserUseCase(repository: resolver.resolve(UserRepository.self))
        }
        
        container.register(UserViewModel.self) { resolver in
            UserViewModel(fetchUserUseCase: resolver.resolve(FetchUserUseCase.self))
        }
        
        return container
    }
}

@main
struct Week3_practiceApp: App {
    private let container = DIContainer.makeAppContainer()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                UserView(viewModel: container.resolve(UserViewModel.self))
            }
        }
    }
}
