//
//  PrmotionVIew.swift
//  iOS26Study
//
//  Created by One on 2/11/26.
//

import SwiftUI

struct PromotionView: View {
    var titleCaption: AttributedString {
        var string = AttributedString("Sky Guide PLUS")
        string.font = .headline
        if let this = string.range(of: "PLUS") {
            string[this].foregroundColor = .blue
            string[this].font = .headline.weight(.heavy)
        }
        return string
    }
    
    var body: some View {
        Section {
            HStack {
                VStack(alignment: .leading) {
                    Text(titleCaption)
                    Text("별 관측 슈퍼파워 잠금 해제")
                        .font(.footnote)
                        .bold()
                        .foregroundStyle(.gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color(.gray))
            }
        }
        .listRowBackground(Color.cyan.opacity(0.3))
    }
    
    
}



#Preview {
    PromotionView()
}
