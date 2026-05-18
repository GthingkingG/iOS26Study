//
//  MapViewModel.swift
//  Week8_Practice
//
//  Created by One on 5/18/26.
//

import SwiftUI
import MapKit

@Observable
final class MapViewModel {
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var currentMapCenter: CLLocationCoordinate2D?
    
    var marker: Marker?
    
    func updateCamera(to coordinate: CLLocationCoordinate2D) {
        cameraPosition = .region(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        )
    }
    
    func updateFromLocation(_ location: CLLocation?) {
        guard let coordinate = location?.coordinate else { return }
        updateCamera(to: coordinate)
    }
}
