//
//  RootView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        switch coordinator.selectedModule {
        case .home:
            HomeView(viewModel: HomeViewModel(
                homeCoordinator: coordinator.makeHomeCoordinator(),
                coordinator: coordinator
            ))
            
        case .user:
            UserNavigationView(coordinator: coordinator.makeUserCoordinator() )
        case .flight:
            FlightNavigationView(coordinator: coordinator.makeFlightCoordinator() )
        case .product:
            ProductNavigationView(coordinator: coordinator.makeProductCoordinator())
        }
    }
}
