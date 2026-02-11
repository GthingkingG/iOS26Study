//
//  ContentView.swift
//  iOS26Study
//
//  Created by One on 2/6/26.
//

import SwiftUI

struct SettingsPractice: View {
    @State var planeStatus: Bool = false
    @State var navigationStatus: Bool = false
    
    var titleCaption: AttributedString {
        var string = AttributedString("이 iPone은 포항공과대학교의 감독 및 관리를 받는 기기입니다. 기기감독에 관하여 더 알아보기...")
        if let this = string.range(of: "기기감독에 관하여 더 알아보기...") {
            string[this].foregroundColor = .blue
        }
        string.font = .caption
    
        return string
    }
    
    var body: some View {
        NavigationStack {
            
            Form{
                Text(titleCaption)
                    .listRowBackground(Color(.systemGroupedBackground))
                    .background(Color(.systemGroupedBackground))
                
                formSection(type: .first)
                
                formSection(type: .second)
                
                formSection(type: .third)
                
            }
            .navigationTitle("설정")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    @ViewBuilder
    private func formSection(type: SectionType) -> some View {
        switch type {
        case .first:
            ProfileView()
        case .second:
            SecondSection(planeStatus: $planeStatus)
        case .third:
            ThirdSection()
        }
    }
}




fileprivate struct SecondSection: View {
    @Binding var planeStatus: Bool
    
    var body: some View {
        Section {
            ForEach(SectionType.second.content, id: \.self) { item in
                if item == .plane {
                    ListView(title: item.title, imageName: item.icon, isToggle: planeStatus, backColor: item.backgroundColor)
                } else if item == .ble || item == .wifi || item == .vpn {
                    ListView(title: item.title, imageName: item.icon, rightText: item.discription ?? "연결 안 됨", backColor: item.backgroundColor)
                } else {
                    ListView(title: item.title, imageName: item.icon, backColor: item.backgroundColor)
                }
                                
            }
        }
    }
}

fileprivate struct ThirdSection: View {
    var body: some View {
        Section {
            ForEach(SectionType.third.content, id: \.self) { item in
                ListView(title: item.title, imageName: item.icon, backColor: item.backgroundColor)
            }
        }
    }
}

#Preview {
    SettingsPractice()
}
