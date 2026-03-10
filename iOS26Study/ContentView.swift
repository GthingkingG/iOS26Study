//
//  ContentView.swift
//  iOS26Study
//
//  Created by One on 3/4/26.
//

import SwiftUI

struct ContentView: View {
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    @State private var sheetStatus: Bool = false
    
    var body: some View {
        VStack {
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
