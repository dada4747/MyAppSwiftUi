//
//  FlightNavigationView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct FlightNavigationView: View {
    @StateObject var coordinator: FlightCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
//            FlightSearchView/*(viewModel: FlightSearchViewModel(coordinator: coordinator, useCase: FlightUseCase(repository: FlightRepositoryImpl(service: MockFlightService(baseURL: coordinator.environment.baseURL)))))*/
            FlightServiceLocator.shared.makeFlightSearchView(coordinator: coordinator)
                .navigationDestination(for: FlightCoordinator.FlightRoute.self) { route in
                    switch route {
                    case .search:
                        FlightServiceLocator.shared.makeFlightSearchView(coordinator: coordinator)
//                        FlightSearchView(viewModel: FlightSearchViewModel(coordinator: coordinator, useCase: FlightUseCase(repository: FlightRepositoryImpl(service: MockFlightService(baseURL: coordinator.environment.baseURL)))))
                    case .list(let searchData):
                        FlightListView(viewModel: FlightListViewModel(coordinator: coordinator, searchResults: searchData))
                    case .detail(let selectedFlight):
                        FlightDetailView(viewModel: FlightDetailViewModel(coordinator: coordinator, selectedFlight: selectedFlight))
                    case .book(let selectedFlight):
                        FlightBookView(viewModel: FlightBookViewModel(coordinator: coordinator, selectedFlight: selectedFlight))
                    case .success:
                        FlightSuccessView(viewModel: FlightSuccessViewModel(coordinator: coordinator))
                    case .failed:
                        FlightFailedView(viewModel: FlightFailedViewModel(coordinator: coordinator))
                    }
                }
        }
    }
}
