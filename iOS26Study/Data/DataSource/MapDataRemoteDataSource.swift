//
//  MapDataRemoteDataSource.swift
//  iOS26Study
//
//  Created by One on 3/15/26.
//

import Foundation
import Moya

protocol MapDataRemoteDataSource {
    func getMapData(lat: String, lon: String) async throws -> MapDataResponseDTO
}

final class MapDataRemoteDataSourceImpl: MapDataRemoteDataSource {
    let provider: MoyaProvider<MapAPI>
    
    init() {
        let logger = NetworkLoggerPlugin(configuration: .init(logOptions: [.verbose]))
        self.provider = MoyaProvider<MapAPI>(plugins: [logger])
    }
    
    func getMapData(lat: String, lon: String) async throws -> MapDataResponseDTO {
        var item: MapDataResponseDTO = .init(addressInfo: .init(fullAddress: "1111111", addressType: "", city_do: "", gu_gun: "", eup_myun: "", adminDong: "", adminDongCode: "", legalDong: "", legalDongCode: "", ri: "", bunji: "", roadName: "", buildingIndex: "", buildingName: "", mappingDistance: "", roadCode: ""))
        provider.request(.gerAddress(lat: lat, lon: lon), completion: { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(MapDataResponseDTO.self, from: response.data)
                    item = decodedData
                    print("AAaAAAAA", item)
                } catch {
                    print("맵 데이터 디코더 오류", error)
                }
            case .failure(let error):
                print("error", error)
            }
        })
        
        print("BBBBBBB", item)
        return item
    }
}

