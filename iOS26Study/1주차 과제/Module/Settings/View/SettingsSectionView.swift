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
    var font: Font
    var textColor: Color

    init(icon: String, title: String, font: Font, textColor: Color) {
        self.icon = icon
        self.title = title
        self.font = font
        self.textColor = textColor
    }
    
    init(icon: String, title: String, description: String? = nil, font: Font, textColor: Color) {
        self.icon = icon
        self.title = title
        self.description = description
        self.font = font
        self.textColor = textColor
    }
    
    var body: some View {
        HStack {
            Text(icon)
            Text(title)
                .font(font)
                .foregroundStyle(textColor)
            Spacer()
            if let description {
                Text(description)
                    .font(.body)
                    .foregroundStyle(.gray)
            }
            Image(systemName: "chevron.right")
                .font(.footnote)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    SettingsSectionView(icon: "🚗", title: "자동차", description: "한글", font: .body, textColor: .white)
}
