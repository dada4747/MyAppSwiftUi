//
//  SignupViewModel.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI
import Combine

class SignupViewModel: ObservableObject {
    @Published var coordinator: UserModuleCoordinator
    private let useCase: UserUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: UserModuleCoordinator, useCase: UserUseCase) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func signup(username: String, password: String) {
//call signup usecase hrere
        
    }
    
    func goBack() { coordinator.goBack() }
}


