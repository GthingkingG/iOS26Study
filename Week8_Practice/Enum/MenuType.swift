//
//  MenuType.swift
//  Week8_Practice
//
//  Created by One on 5/18/26.
//

import Foundation

enum MenuType: String, CaseIterable, Identifiable  {
    case filter
    case map
    
    var id: String { rawValue }
    
    var menuString: String {
        switch self {
        case .filter:
            return "역 필터"
        case .map:
            return "지도"
        }
    }
    
    var menuImage: String {
        switch self {
        case .filter:
            return "sailboat"
        case .map:
            return "map"
        }
    }
}
