//
//  ToggleSectionView.swift
//  iOS26Study
//
//  Created by One on 2/12/26.
//

import SwiftUI

struct ToggleSectionView: View {
    var icon: String
    var title: String
    @Bindable var settingsViewModel: SettingsViewModel
    
    var body: some View {
        HStack {
            Text(icon)
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
            Spacer()
            Toggle("", isOn: $settingsViewModel.markStatus)
        }
    }
}

#Preview {
    ToggleSectionView(icon: "🚗", title: "자동차", settingsViewModel: .init())
}
