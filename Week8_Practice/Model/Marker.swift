//
//  Marker.swift
//  Week8_Practice
//
//  Created by One on 5/18/26.
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id: UUID
    let coordinate: CLLocationCoordinate2D
    let title: String
}
