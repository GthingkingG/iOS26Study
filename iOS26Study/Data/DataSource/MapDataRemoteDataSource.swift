//
//  MapDataRemoteDataSource.swift
//  iOS26Study
//
//  Created by One on 3/15/26.
//

import Foundation
import Moya

protocol MapDataRemoteDataSource {
    func getMapData(lat: String, lon: String) async throws -> MapDataDTO
}

final class MapDataRemoteDataSourceImpl: MapDataRemoteDataSource {
    let provider: MoyaProvider<MapAPI>
    
    init() {
        let logger = NetworkLoggerPlugin(configuration: .init(logOptions: [.verbose]))
        self.provider = MoyaProvider<MapAPI>(plugins: [logger])
    }
    
    func getMapData(lat: String, lon: String) async throws -> MapDataDTO {
        var item: MapDataDTO = .init(addressInfo: .init(fullAddress: "initial"), lat: lat, lon: lon)
        
        provider.request(.gerAddress(lat: lat, lon: lon), completion: { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(MapDataDTO.self, from: response.data)
                    item = decodedData
                } catch {
                    print("맵 데이터 디코더 오류", error)
                }
            case .failure(let error):
                print("error", error)
            }
        })
        return item
    }
}

