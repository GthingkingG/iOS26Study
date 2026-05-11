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
                            ForEach(MenuType.allCases) { menu in
                                Menu {
                                    Picker("역필터", selection: $filter) {
                                        ForEach(FilterType.allCases) { type in
                                            Label(type.typeString, systemImage: type.typeImage)
                                                .tag(type)
                                        }
                                    }
                                } label: {
                                    HStack(spacing: 4) {
                                        Image(systemName: menu.menuImage)
                                        Text(menu.menuString)
                                        Image(systemName: "chevron.down")
                                    }
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
}

#Preview {
    ContentView()
}
