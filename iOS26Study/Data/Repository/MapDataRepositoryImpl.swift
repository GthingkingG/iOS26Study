//
//  MapDataRepositoryImpl.swift
//  iOS26Study
//
//  Created by One on 3/15/26.
//

import Foundation

final class MapDataRepositoryImpl: MapDataRepository {
    private let remote: MapDataRemoteDataSource
    
    init(remote: MapDataRemoteDataSource) {
        self.remote = remote
    }
    
    func getMap(lat: String, lon: String) async throws -> MapData {
        let dto = try await remote.getMapData(lat: lat, lon: lon)
        return MapData(fullAddress: dto.toDomain(), lat: lat, lon: lon)
    }
}
