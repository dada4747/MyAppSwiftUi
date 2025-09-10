//
//  HomeViewModel.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
//    @Published var coordinator: MainCoordinator
    @Published var homeCoordinator: HomeModuleCoordinator
    var mainCoordinator: AppCoordinator

    init(homeCoordinator: HomeModuleCoordinator, coordinator: AppCoordinator) {
        self.homeCoordinator = homeCoordinator
        self.mainCoordinator = coordinator
    }
    
    func goToUser() {
        mainCoordinator.goToModule(.user)
    }
    
    func goToFlight() {
        mainCoordinator.goToModule(.flight)
    }
    func goToProduct() {
        mainCoordinator.goToModule(.product)
    }
    
}
