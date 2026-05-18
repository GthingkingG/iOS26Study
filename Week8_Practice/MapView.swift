//
//  MapView.swift
//  Week8_Practice
//
//  Created by One on 5/18/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Binding var filter: FilterType
    @Binding var map: MapType
    
    var body: some View {
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
