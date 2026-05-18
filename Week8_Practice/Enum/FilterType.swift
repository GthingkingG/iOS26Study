//
//  FilterType.swift
//  Week8_Practice
//
//  Created by One on 5/18/26.
//

import Foundation

enum FilterType: String, CaseIterable, Identifiable {
    case all
    case my
    case cur
    
    var id: String { rawValue }
    
    var typeString: String {
        switch self {
        case .all:
            return "모든 관측소"
        case .my:
            return "내 관측소"
        case .cur:
            return "현재 관측소만"
        }
    }
    
    var typeImage: String {
        switch self {
        case .all:
            return "globe.europe.africa"
        case .my:
            return "star.circle"
        case .cur:
            return "location.fill"
        }
    }
}
