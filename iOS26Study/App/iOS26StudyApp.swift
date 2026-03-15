//
//  iOS26StudyApp.swift
//  iOS26Study
//
//  Created by One on 2/6/26.
//

import SwiftUI

extension DIContainer {
    static func makeAppContainer() -> DIContainer {
        let container = DIContainer()
        
        container.register(MapDataRemoteDataSource.self, scope: .singleton) { _ in
            MapDataRemoteDataSourceImpl()
        }
        
        container.register(MapDataRepository.self, scope: .singleton) { resolver in
            MapDataRepositoryImpl(remote: resolver.resolve(MapDataRemoteDataSource.self))
        }
        
        container.register(GetMapDataUseCase.self) { resolver in
            GetMapDataUseCase(repository: resolver.resolve(MapDataRepository.self))
        }
        
        container.register(ContentsViewModel.self) { resolver in
            ContentsViewModel(getMapDataUseCase: resolver.resolve(GetMapDataUseCase.self))
        }
        
        return container
    }
}

@main
struct iOS26StudyApp: App {
    private let container = DIContainer.makeAppContainer()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(contentViewModel: container.resolve(ContentsViewModel.self))
            }
        }
    }
}
