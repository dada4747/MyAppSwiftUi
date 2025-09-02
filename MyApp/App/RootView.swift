//
//  RootView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        switch coordinator.selectedModule {
        case .home:
//            HomeView(viewModel: HomeViewModel(coordinator: coordinator))
            HomeView(viewModel: HomeViewModel(
                homeCoordinator: coordinator.homeCoordinator,
                coordinator: coordinator
            ))

        case .user:
            UserNavigationView(coordinator: UserModuleCoordinator(environment: coordinator.environment, parent: coordinator))
        case .flight:
            FlightNavigationView(coordinator: FlightCoordinator(environment: coordinator.environment, parent: coordinator))
        }
    }
}
