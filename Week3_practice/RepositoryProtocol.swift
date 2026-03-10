//
//  RepositoryProtocol.swift
//  Week3_practice
//
//  Created by One on 3/5/26.
//

import Foundation

protocol UserRepository {
    func fetchUser(id: Int) async throws -> User
}
