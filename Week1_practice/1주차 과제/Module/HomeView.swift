//
//  HomeView.swift
//  iOS26Study
//
//  Created by One on 2/11/26.
//

import SwiftUI

struct HomeView: View {
    @State var settingsStatus: Bool = false
    
    var body: some View {
        Button("Setting", action: {
            settingsStatus.toggle()
        })
        .buttonStyle(.glass)
        .tint(.blue)
        .sheet(isPresented: $settingsStatus, content: {
            SettingsView()
                .presentationDragIndicator(.visible)
        })

        
    }
}

#Preview {
    HomeView()
}
