//
//  Radius.swift
//  iOS26Study
//
//  Created by One on 2/6/26.
//

import SwiftUI

struct Radius: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.red)
                .frame(width: 200, height: 200)
                .glassEffect(.clear, in: .rect(corners: .concentric(), isUniform: true))
            
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            ConcentricRectangle()
            
            ContainerRelativeShape()
            
            Text("Hello, World!")
                .font(.title)
                .padding()
                .glassEffect()


            Text("Hello, World!")
                .font(.title)
                .padding()
                .glassEffect(in: .rect(cornerRadius: 16.0))


            Text("Hello, World!")
                .font(.title)
                .padding()
                .glassEffect(.regular.tint(.orange).interactive())
        }
        .background {
            
        }
    }
}

#Preview {
    Radius()
}
