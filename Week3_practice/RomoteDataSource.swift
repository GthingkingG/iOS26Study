//
//  RomoteDataSource.swift
//  Week3_practice
//
//  Created by One on 3/5/26.
//

import Foundation

protocol UserRemoteDataSource {
    func fetchUser(id: Int) async throws -> UserDTO
}

final class UserRemoteDataSourceImpl: UserRemoteDataSource {
    func fetchUser(id: Int) async throws -> UserDTO {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(id)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(UserDTO.self, from: data)
    }
}
