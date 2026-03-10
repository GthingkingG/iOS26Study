//
//  Repository.swift
//  Week3_practice
//
//  Created by One on 3/5/26.
//

import Foundation

final class UserRepositoryImpl: UserRepository {
    private let remote: UserRemoteDataSource
    
    init(remote: UserRemoteDataSource) {
        self.remote = remote
    }
    
    func fetchUser(id: Int) async throws -> User {
        let dto = try await remote.fetchUser(id: id)
        return dto.toDomain()
    }
}

//DTO로부터 Data Model 뽑는 과정
