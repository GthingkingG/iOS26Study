//
//  DIContainer.swift
//  iOS26Study
//
//  Created by One on 3/4/26.
//

import Foundation

extension DIContainer {
    static func makeAppContainer() -> DIContainer {
        let container = DIContainer()
        
        container.register(NetworkClient.self, scope: .singleton) { _ in
            URLSessionNetworkClient()
        }
        
        container.register(UserRepository.self, scope: .singleton) { resolver in
            DefaultUserRepository(networkClient: resolver.resolve(NetworkClient.self))
        }
        
        container.register(GetUserNameUseCase.self) { resolver in
            GetUserNameUseCase(repository: resolver.resolve(UserRepository.self))
        }
        
        container.register(UserViewModel.self) { resolver in
            UserViewModel(useCase: resolver.resolve(GetUserNameUseCase.self))
        }
        
        return container
    }
}
