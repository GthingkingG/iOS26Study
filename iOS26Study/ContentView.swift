//
//  ContentView.swift
//  iOS26Study
//
//  Created by One on 3/4/26.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @Bindable var contentViewModel: ContentsViewModel = .init()
    
    
    var body: some View {
        VStack {
            Map(initialPosition: .region(region)) {
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
                contentViewModel.sheetStatus.toggle()
                //MapKit에 어노테이션 추가
                contentViewModel.getMapData()
                print(contentViewModel.latitude)
                print(contentViewModel.longitude)
            }, label: {
                Text("주소 보기")
                    .font(.headline)
            })
        }
        .sheet(isPresented: $contentViewModel.sheetStatus, content: {
            Text(contentViewModel.mapDataDTO?.addressInfo.fullAddress ?? "결과없음")
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

#Preview {
    ContentView()
}
