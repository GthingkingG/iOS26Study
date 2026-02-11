//
//  SettingsSectionView.swift
//  iOS26Study
//
//  Created by One on 2/11/26.
//

import SwiftUI

struct SettingsSectionView: View {
    var icon: String
    var title: String
    var description: String?
    
    var body: some View {
        HStack {
            Text(icon)
            Text(title)
                .font(.body)
                .foregroundStyle(.white)
            Spacer()
            if let description {
                Text(description)
                    .font(.body)
                    .foregroundStyle(.gray)
            }
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    SettingsSectionView(icon: "🟠", title: "위치")
}
