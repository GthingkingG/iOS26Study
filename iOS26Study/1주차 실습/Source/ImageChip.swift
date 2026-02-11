//
//  ImageChip.swift
//  iOS26Study
//
//  Created by One on 2/6/26.
//

import SwiftUI

struct ImageChip: View {
    var name: String
    var color: Color
    
    var body: some View {
        Image(systemName: name)
            .foregroundStyle(.white)
            .padding(4)
            .background(content: {
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
                    .frame(width: 24, height: 24)
                    .glassEffect(.clear, in: .rect(corners: .concentric(), isUniform: false))
                
            })
    }
}

#Preview {
    ImageChip(name: "airplane", color: .orange)
}
