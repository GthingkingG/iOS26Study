//
//  ProfileView.swift
//  iOS26Study
//
//  Created by One on 2/11/26.
//

import SwiftUI

struct ProfileView: View {
    var item: SectionRow = .profile
    
    var body: some View {
        Section {
            HStack {
                Circle()
                    .foregroundStyle(item.backgroundColor)
                    .frame(width: 44)
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .foregroundStyle(.black)
                    Text(item.discription ?? "연결 안 됨")
                        .font(.caption)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .foregroundStyle(.gray)
        }
    }
}

#Preview {
    ProfileView()
}
