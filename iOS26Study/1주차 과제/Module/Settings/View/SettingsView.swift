//
//  SettingsView.swift
//  iOS26Study
//
//  Created by One on 2/11/26.
//

import SwiftUI

struct SettingsView: View {
    var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                PromotionView()  //상단 PLUS 등급 뷰
                
                //각 섹션 뷰
                ForEach(SettingsSectionType.allCases, id: \.self) { sec in
                    formSection(type: sec)
                }
                
                //하단 앱 설명 뷰
                AppIntroView()
            }
            .navigationTitle("설정")
        }
    }
    
    @ViewBuilder
    private func formSection(type: SettingsSectionType) -> some View {
        switch type {
        case .first:
            FirstView()
        case .reference:
            ReferenceView()
        case .interface:
            InterfaceView()
        case .pro:
            ProView()
        case .donation:
            DonationView()
        case .etc:
            ETCView()
        }
    }
}

fileprivate struct FirstView: View {
    var body: some View {
        Section {
            ForEach(SettingsSectionType.first.content, id: \.self) { item in
                formList(type: item.viewType, item: item)
            }
        }
    }
}

fileprivate struct ReferenceView: View {
    var body: some View {
        Section("참조", content: {
            ForEach(SettingsSectionType.reference.content, id: \.self) { item in
                formList(type: item.viewType, item: item)
            }
        })
    }
}

fileprivate struct InterfaceView: View {
    var body: some View {
        Section("인터페이스", content: {
            ForEach(SettingsSectionType.interface.content, id: \.self) { item in
                formList(type: item.viewType, item: item)
            }
        })
    }
}

fileprivate struct ProView: View {
    var body: some View {
        Section(content: {
            ForEach(SettingsSectionType.pro.content, id: \.self) { item in
                formList(type: item.viewType, item: item)
            }
        }, header: {
            Text("PRO")
                .font(.subheadline)
                .bold()
                .foregroundStyle(.white)
                .padding(4)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.pink.opacity(0.6))
                })
        })
        .listRowBackground(Color.pink.opacity(0.2))
    }
}

fileprivate struct DonationView: View {
    var body: some View {
        Section {
            ForEach(SettingsSectionType.donation.content, id: \.self) { item in
                formList(type: item.viewType, item: item)
            }
        }
    }
}

fileprivate struct ETCView: View {
    var body: some View {
        Section {
            ForEach(SettingsSectionType.etc.content, id: \.self) { item in
                formList(type: item.viewType, item: item)
            }
        }
    }
}

///SectionView 생성 함수
@ViewBuilder
func formList(type: SectionViewType, item: SettingsSectionRow) -> some View {
    switch type {
    case .normal:
        SettingsSectionView(icon: item.icon, title: item.title, font: item.font, textColor: item.titleColor)
    case .decsription:
        SettingsSectionView(icon: item.icon, title: item.title, description: "설정 중", font: item.font, textColor: item.titleColor)
    case .toggle:
        ToggleSectionView(icon: item.icon, title: item.title, settingsViewModel: .init())
    }
}

#Preview {
    SettingsView()
}
