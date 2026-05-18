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
    
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                NavigationStack {
                    MapView(filter: $filter, map: $map)
                }
                .navigationTitle("home")
            }
            
        }
        .tabViewBottomAccessory(isEnabled: true) {
            Button(action: {
                print("바텀 악세서리 버튼")
            }, label: {
                HStack {
                    Text("경도: ")
                    Text("위도: ")
                    Spacer()
                    Text("My")
                }
                .padding(.horizontal)
            })
        }
    }
}

#Preview {
    ContentView()
}
