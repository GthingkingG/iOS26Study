//
//  GetMapUseCase.swift
//  iOS26Study
//
//  Created by One on 3/15/26.
//

import Foundation

struct GetMapDataUseCase {
    private let repository: MapDataRepository
    
    init(repository: MapDataRepository) {
        self.repository = repository
    }
    
    func execute(lat: String, lon: String) async throws -> MapData {
        try await repository.getMap(lat: lat, lon: lon)
    }
}
