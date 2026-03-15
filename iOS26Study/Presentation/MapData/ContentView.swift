//
//  ContentView.swift
//  iOS26Study
//
//  Created by One on 3/4/26.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @Bindable private var locationManager = LocationManager.shared
    @Bindable var contentViewModel: ContentsViewModel
    
    
    var body: some View {
        VStack {
            Map(position: $contentViewModel.cameraPosition) {
                ForEach(contentViewModel.marker, id: \.id, content: { marker in
                    Annotation(marker.title, coordinate: marker.coordinate, content: {
                        Image(systemName: "mappin.circle.fill")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(Color.red)
                    })
                    
                })
            }
            
            VStack(alignment: .center) {
                
                TextField("위도", text: $contentViewModel.latitude)
                
                Divider()
                
                TextField("경도", text: $contentViewModel.longitude)
                
            }
            .padding()
            .border(.green)
            
            Button(action: {
                Task {
                    contentViewModel.sheetStatus.toggle()
                    //MapKit에 어노테이션 추가
                    await contentViewModel.loadMapData(lat: contentViewModel.latitude, lon: contentViewModel.longitude)
                }
            }, label: {
                Text("주소 보기")
                    .font(.headline)
            })
        }
        .sheet(isPresented: $contentViewModel.sheetStatus, content: {
            Text(contentViewModel.currentMapData?.fullAddress ?? "결과없음")
                .padding()
                .border(.green)
            HStack {
                Button(action: {
                    contentViewModel.pushAddress()
                    contentViewModel.closeSheet()
                }, label: {
                    Text("저장")
                        .font(.headline)
                        .foregroundStyle(.blue)
                })
                
                Button(action: {
                    contentViewModel.closeSheet()
                }, label: {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(.red)
                        .padding(20)
                })
            }
        })
    }
}
