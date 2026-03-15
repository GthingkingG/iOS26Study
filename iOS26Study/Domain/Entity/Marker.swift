//
//  Marker.swift
//  iOS26Study
//
//  Created by One on 3/10/26.
//

import Foundation
import MapKit

struct Marker {
    var id = UUID()
    var title: String
    var coordinate: CLLocationCoordinate2D
}
