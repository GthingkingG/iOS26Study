//
//  MapType.swift
//  Week8_Practice
//
//  Created by One on 5/18/26.
//

import Foundation

enum MapType: String, CaseIterable, Identifiable {
    case standard
    case satellite
    
    var id: String { rawValue }
    
    var typeString: String {
        switch self {
        case .standard:
            return "표준"
        case .satellite:
            return "위성"
        }
    }
    
    var typeImage: String {
        switch self {
        case .standard:
            return "map"
        case .satellite:
            return "mountain.2.fill"
        }
    }
}
