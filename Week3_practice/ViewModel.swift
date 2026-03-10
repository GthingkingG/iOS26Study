//
//  ViewModel.swift
//  Week3_practice
//
//  Created by One on 3/5/26.
//

import Foundation
import Combine

@MainActor
final class UserViewModel: ObservableObject {
    @Published var name: String = "-"
    @Published var email: String = "-"
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let fetchUserUseCase: FetchUserUseCase
    
    init(fetchUserUseCase: FetchUserUseCase) {
        self.fetchUserUseCase = fetchUserUseCase
    }
    
    func loadUser(id: Int) {
        Task {
            isLoading = true
            defer { isLoading = false }
            
            do {
                let user = try await fetchUserUseCase.execute(id: id)
                name = user.name
                email = user.email
                errorMessage = nil
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
