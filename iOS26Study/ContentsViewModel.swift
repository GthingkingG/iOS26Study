//
//  ContentsViewModel.swift
//  iOS26Study
//
//  Created by One on 3/10/26.
//

import Foundation
import Moya

@Observable
class ContentsViewModel {
    var mapData: MapData?
    let provider: MoyaProvider<MapAPI>
    
    init() {
        let logger = NetworkLoggerPlugin(configuration: .init(logOptions: [.verbose]))
        self.provider = MoyaProvider<MapAPI>(plugins: [logger])
    }
    
    func getMapData(lat: String, lon: String) {
        provider.request(.gerAddress(lat: lat, lon: lon), completion: { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(MapData.self, from: response.data)
                    self?.mapData = decodedData
                } catch {
                    print("맵 데이터 디코더 오류", error)
                }
            case .failure(let error):
                print("error", error)
            }
        })
    }
}
