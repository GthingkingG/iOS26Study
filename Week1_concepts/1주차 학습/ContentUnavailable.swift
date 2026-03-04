//
//  temp.swift
//  iOS26Study
//
//  Created by One on 2/10/26.
//

import SwiftUI

struct temp: View {
    var body: some View {
        ContentUnavailableView {
            Label("No Mail", systemImage: "tray.fill")
        } description: {
            Text("New mails you receive will appear here.")
        }
    }
}

#Preview {
    temp()
}
