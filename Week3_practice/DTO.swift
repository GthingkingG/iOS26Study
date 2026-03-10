//
//  DTO.swift
//  Week3_practice
//
//  Created by One on 3/5/26.
//

import Foundation

struct UserDTO: Decodable {
    let id: Int
    let name: String
    let email: String
}

extension UserDTO {
    func toDomain() -> User {
        User(id: id, name: name, email: email)
    }
}
