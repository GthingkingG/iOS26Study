//
//  AppIntroView.swift
//  iOS26Study
//
//  Created by One on 2/12/26.
//

import SwiftUI

struct AppIntroView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center) {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 44, height: 44)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Sky Guide 버전 12.0.11")
                    .font(.subheadline)
                    .foregroundStyle(.cyan)
            }
            Spacer()
        }
        .listRowBackground(Color(.systemGroupedBackground))
    }
}

#Preview {
    AppIntroView()
}
