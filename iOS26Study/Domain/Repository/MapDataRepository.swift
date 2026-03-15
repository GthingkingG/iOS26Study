//
//  MapRepository.swift
//  iOS26Study
//
//  Created by One on 3/15/26.
//

import Foundation

protocol MapDataRepository {
    func getMap(lat: String, lon: String) async throws -> MapData
}
