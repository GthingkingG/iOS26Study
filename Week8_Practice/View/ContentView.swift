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
    @Environment(\.tabViewBottomAccessoryPlacement) private var placement
    @Bindable var locationManager = LocationManager.shared
    @State var isToggle: Bool = false
    
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                NavigationStack {
                    MapView(filter: $filter, map: $map)
                }
                .navigationTitle("home")
            }
            
        }
        .tabBarMinimizeBehavior(.automatic)
        .tabViewBottomAccessory {
            HStack {
                if isToggle {
                    Text("경도: \(locationManager.currentLocation?.coordinate.longitude ?? 0)")
                    Text("위도: \(locationManager.currentLocation?.coordinate.latitude ?? 0)")
                }
                Button(action: {
                    isToggle.toggle()
                }, label: {
                    Text("My")
                })
            }
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    ContentView()
}
