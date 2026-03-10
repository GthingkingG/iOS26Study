//
//  ContentView.swift
//  iOS26Study
//
//  Created by One on 3/4/26.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    @State private var sheetStatus: Bool = false
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var marker: Marker = .init(title: "임시", coordinate: .init(latitude: 37.5665, longitude: 126.9780))
    
    var body: some View {
        VStack {
            Map(initialPosition: .region(region))
            
            VStack(alignment: .center) {
                
                TextField("위도", text: $latitude)
                
                Divider()
                
                TextField("경도", text: $longitude)
                
            }
            .padding()
            .border(.green)
            
            Button(action: {
                sheetStatus.toggle()
                //MapKit에 어노테이션 추가
            }, label: {
                Text("주소 보기")
                    .font(.headline)
            })
        }
        .sheet(isPresented: $sheetStatus, content: {
            Text("주소")
                .padding()
                .border(.green)
            Button(action: {
                sheetStatus = false
            }, label: {
                Image(systemName: "xmark.circle")
                    .foregroundStyle(.red)
                    .padding(20)
            })
        })
    }
}

#Preview {
    ContentView()
}
