//
//  ContentsViewModel.swift
//  iOS26Study
//
//  Created by One on 3/10/26.
//

import SwiftUI
import Moya
import MapKit

@Observable
class ContentsViewModel {
    var latitude: String = "37.5665"
    var longitude: String = "126.9780"
    var currentMapData: MapData?
    
    var mapDataDTO: MapDataDTO?
    let provider: MoyaProvider<MapAPI>
    
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var marker: [Marker] = []
    
    var sheetStatus: Bool = false
    
    init() {
        let logger = NetworkLoggerPlugin(configuration: .init(logOptions: [.verbose]))
        self.provider = MoyaProvider<MapAPI>(plugins: [logger])
    }
    
    func getMapData() {
        print(latitude, longitude)
        provider.request(.gerAddress(lat: latitude, lon: longitude), completion: { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(MapDataDTO.self, from: response.data)
                    self?.mapDataDTO = decodedData
                } catch {
                    print("맵 데이터 디코더 오류", error)
                }
            case .failure(let error):
                print("error", error)
            }
        })
    }
    
    func pushAddress() {
        if let mapDataDTO = self.mapDataDTO {
            self.currentMapData = .init(fullAddress: mapDataDTO.addressInfo.fullAddress, lat: self.latitude, lon: self.longitude)
        }
        if let currentMapData = self.currentMapData {
            let item: Marker = .init(title: currentMapData.fullAddress, coordinate: .init(latitude: Double(self.latitude)!, longitude: Double(self.longitude)!))
            self.marker.append(item)
        }
        self.currentMapData = nil
    }
    
    func closeSheet() {
        self.sheetStatus = false
    }
    
}
