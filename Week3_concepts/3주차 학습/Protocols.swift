//
//  Protocols.swift
//  iOS26Study
//
//  Created by One on 3/4/26.
//

import Foundation

protocol NetworkClient {
    func get(url: URL) async throws -> Data
}

protocol UserRepository {
    func fetchUserName(id: Int) async throws -> String
}
