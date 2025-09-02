//
//  ForgotViewModel.swift
//  MyApp
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class ForgotViewModel: ObservableObject {
    @Published var coordinator: UserModuleCoordinator
    private let useCase: UserUseCase
    
    init(coordinator: UserModuleCoordinator, useCase: UserUseCase) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func forgot(email: String) {
        if useCase.executeForgotPassword(email: email) {
            coordinator.goToHome()
        }
    }
    func goBack() { coordinator.goBack() }
}
