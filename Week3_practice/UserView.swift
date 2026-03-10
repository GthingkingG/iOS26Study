//
//  UserView.swift
//  Week3_practice
//
//  Created by One on 3/5/26.
//

import SwiftUI

struct UserView: View {
    @StateObject private var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 12) {
            if viewModel.isLoading {
                ProgressView()
            } else {
                Text("Name: \(viewModel.name)")
                Text("Email: \(viewModel.email)")
            }
            
            Button("Load User") {
                viewModel.loadUser(id: 1)
            }
            
            if let message = viewModel.errorMessage {
                Text(message)
                    .foregroundStyle(.red)
            }
        }
        .padding()
        .navigationTitle("Clean Architecture")
    }
}


