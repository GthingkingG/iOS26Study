//
//  iOS26StudyTests.swift
//  iOS26StudyTests
//
//  Created by One on 3/7/26.
//

import XCTest
@testable import Week3_practice

final class MockUserRepository: UserRepository {
    var result: Result<User, Error> = .success(User(id: 1, name: "Mock", email: "mock@test.com"))
    
    func fetchUser(id: Int) async throws -> User {
        try result.get()
    }
}

final class FetchUserUseCaseTests: XCTestCase {
    func testExecuteRetrunsUser() async throws {
        let repo = MockUserRepository()
        let useCase = FetchUserUseCase(repository: repo)
        
        let user = try await useCase.execute(id: 1)
        
        XCTAssertEqual(user.name, "Mock")
    }
}
