//
//  URLSessionNetwork.swift
//  iOS26Study
//
//  Created by One on 3/4/26.
//

import Foundation

final class URLSessionNetworkClient: NetworkClient {
    func get(url: URL) async throws -> Data {
        let(data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}

final class DefaultUserRepository: UserRepository {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func fetchUserName(id: Int) async throws -> String {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(id)")!
        let data = try await networkClient.get(url: url)
        
        struct DTO: Decodable { let name: String }
        let dto = try JSONDecoder().decode(DTO.self, from: data)
        return dto.name
    }
}
