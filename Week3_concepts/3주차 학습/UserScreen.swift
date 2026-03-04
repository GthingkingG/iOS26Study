//
//  UserScreen.swift
//  iOS26Study
//
//  Created by One on 3/4/26.
//

import SwiftUI

struct UserScreen: View {
    @StateObject private var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 12) {
            if viewModel.isLoading {
                ProgressView()
            } else {
                Text("User Name: \(viewModel.name)")
            }
            
            Button("Load") {
                viewModel.load(userID: 1)
            }
            
            if let message = viewModel.errorMessage {
                Text(message).foregroundStyle(.red)
            }
        }
        .padding()
        .navigationTitle("DI Example")
    }
}


