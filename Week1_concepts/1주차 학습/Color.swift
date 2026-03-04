//
//  SwiftUIView.swift
//  iOS26Study
//
//  Created by One on 2/6/26.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Button(role: .cancel, action: {})
                .buttonStyle(.glass)
                .tint(.green)

            
            Button(role: .cancel, action: {})
                .buttonStyle(.glassProminent)
            
            Text("regular")
                .padding()
                .clipShape(.capsule)
                .glassEffect(.clear.interactive().tint(.red), in: .capsule)
            
            Text("clear")
                .padding()
                .clipShape(.capsule)
                .glassEffect(.clear.tint(.red), in: .capsule)
        }
    }
}

#Preview {
    SwiftUIView()
}
