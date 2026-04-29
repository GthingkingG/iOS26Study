//
//  testVie.swift
//  iOS26Study
//
//  Created by One on 4/1/26.
//

import SwiftUI

struct ToolbarStyling: View {

    var body: some View {
        VStack {
            Text("aaa")
            Rectangle()
                .fill(.clear)
                .frame(width: 100, height: 100)
        }
        .tabViewBottomAccessory{
            Text("AAA")
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    Circle()
    
    Circle()
    
    Text("11")
}
