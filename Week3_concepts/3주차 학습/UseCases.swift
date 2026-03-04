//
//  UseCases.swift
//  iOS26Study
//
//  Created by One on 3/4/26.
//

import Foundation
import Combine

struct GetUserNameUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(userID: Int) async throws -> String {
        try await repository.fetchUserName(id: userID)
    }
}

@MainActor
final class UserViewModel: ObservableObject {
    @Published var name: String = "-"
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let useCase: GetUserNameUseCase
    
    init(useCase: GetUserNameUseCase) {
        self.useCase = useCase
    }
    
    func load(userID: Int) {
        Task {
            isLoading = true
            
            defer { isLoading = false }
            
            do {
                name = try await useCase.execute(userID: userID)
                errorMessage = name
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
