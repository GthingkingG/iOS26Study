//
//  SettingsView.swift
//  iOS26Study
//
//  Created by One on 2/11/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                PromotionView()
                ForEach(SettingsSectionType.allCases, id: \.self) { sec in
                    formSection(type: sec)
                }
                
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
                Text(item.title)
            }
        }
    }
}

fileprivate struct ReferenceView: View {
    var body: some View {
        Section("참조", content: {
            ForEach(SettingsSectionType.reference.content, id: \.self) { item in
                Text(item.title)
            }
        })
    }
}

fileprivate struct InterfaceView: View {
    var body: some View {
        Section("인터페이스", content: {
            ForEach(SettingsSectionType.interface.content, id: \.self) { item in
                Text(item.title)
            }
        })
    }
}

fileprivate struct ProView: View {
    var body: some View {
        Section(content: {
            ForEach(SettingsSectionType.pro.content, id: \.self) { item in
                Text(item.title)
            }
            .foregroundStyle(Color.gray)
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
                Text(item.title)
            }
        }
    }
}

fileprivate struct ETCView: View {
    var body: some View {
        Section {
            ForEach(SettingsSectionType.etc.content, id: \.self) { item in
                Text(item.title)
            }
        }
    }
}

#Preview {
    SettingsView()
}
