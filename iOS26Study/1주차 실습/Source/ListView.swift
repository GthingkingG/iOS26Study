//
//  ListView.swift
//  iOS26Study
//
//  Created by One on 2/6/26.
//

import SwiftUI

struct ListView: View {
    var title: String
    var imageName: String
    var backColor: Color
    var rightText: String?
    var isToggle: Bool?
    
    init(title: String, imageName: String, rightText: String, backColor: Color) {
        self.title = title
        self.imageName = imageName
        self.rightText = rightText
        self.backColor = backColor
    }
    
    
    init(title: String, imageName: String, backColor: Color) {
        self.title = title
        self.imageName = imageName
        self.backColor = backColor
    }

    init(title: String, imageName: String, isToggle: Bool, backColor: Color) {
        self.title = title
        self.imageName = imageName
        self.isToggle = isToggle
        self.backColor = backColor
    }
    
    var body: some View {
        HStack {
            ImageChip(name: imageName, color: backColor)
            
            
            Text(title)
                .foregroundStyle(.black)
                .font(.body)
            Spacer()
            if let rightText {
                Text(rightText)
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
            
        }
    }
}

#Preview {
    ListView(title: "Wi-Fi", imageName: "wifi", rightText: "연결 안 됨" , backColor: .blue)
}

/*
 
 
 init(title: String, imageName: String, rightText: String, backColor: Color) {
     self.title = title
     self.imageName = imageName
     self.right = .text
     self.backColor = backColor
 }
 
 
 init(title: String, imageName: String, backColor: Color) {
     self.title = title
     self.imageName = imageName
     self.right = .chevron
     self.backColor = backColor
 }

 init(title: String, imageName: String, isToggle: Binding<Bool>, backColor: Color) {
     self.title = title
     self.imageName = imageName
     self.right = .toogle
     self.backColor = backColor
 }

 
 */
