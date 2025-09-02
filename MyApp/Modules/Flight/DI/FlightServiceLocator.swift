//
//  FlightServiceLocator.swift
//  MyApp
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class FlightServiceLocator {
    static let shared = FlightServiceLocator()
    
    private func makeFlightUseCase(baseURL: String, env: AppEnvironmentType) -> FlightUseCase {
        let service: FlightService
        switch env {
        case .mock:
            service = MockFlightService(baseURL: baseURL)
        case .live:
            service = LiveFlightService(baseURL: baseURL)
        }
        return FlightUseCase(repository: FlightRepositoryImpl(service: service))
    }
    
    func makeFlightSearchView(coordinator: FlightCoordinator) -> some View {
        let useCase = makeFlightUseCase(
            baseURL: coordinator.environment.baseURL,
            env: coordinator.environment.current
        )
        let viewModel = FlightSearchViewModel(coordinator: coordinator, useCase: useCase)
        return FlightSearchView(viewModel: viewModel)
    }
}
