//
//  UseCase.swift
//  Week3_practice
//
//  Created by One on 3/5/26.
//

import Foundation

struct FetchUserUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> User {
        try await repository.fetchUser(id: id)
    }
}
