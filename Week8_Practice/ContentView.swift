//
//  ContentView.swift
//  Week8_Practice
//
//  Created by One on 5/7/26.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var filter: FilterType = .all
    @State var map: MapType = .satellite
    
    
    var body: some View {
        NavigationStack {
            Map()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("관측소 지도")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Menu {
                                Picker(MenuType.filter.menuString, selection: $filter) {
                                    ForEach(FilterType.allCases) { type in
                                        Label(type.typeString, systemImage: type.typeImage)
                                            .tag(type)
                                    }
                                }
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: MenuType.filter.menuImage)
                                    Text(MenuType.filter.menuString)
                                    Image(systemName: "chevron.down")
                                }
                            }
                            
                            Menu {
                                Picker(MenuType.map.menuString, selection: $map) {
                                    ForEach(MapType.allCases) { type in
                                        Label(type.typeString, systemImage: type.typeImage)
                                            .tag(type)
                                    }
                                }
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: MenuType.map.menuImage)
                                    Text(MenuType.map.menuString)
                                    Image(systemName: "chevron.down")
                                }
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .foregroundStyle(.secondary)
                                .glassEffect(.clear)
                        }
                    }
                    
                }
        }
    }
    
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
}

#Preview {
    ContentView()
}
