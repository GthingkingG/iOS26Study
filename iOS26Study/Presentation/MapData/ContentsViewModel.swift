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
    
    var sheetStatus: Bool = false
    
    private let getMapDataUseCase: GetMapDataUseCase
    
    init (getMapDataUseCase: GetMapDataUseCase) {
        self.getMapDataUseCase = getMapDataUseCase
    }
    
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var marker: [Marker] = []
    
    
    
    func loadMapData(lat: String, lon: String) async {
        do {
            let MapData = try await getMapDataUseCase.execute(lat: lat, lon: lon)
            self.currentMapData = MapData
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func pushAddress() {
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
