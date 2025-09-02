//
//  FlightSearchViewModel.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class FlightSearchViewModel: ObservableObject {
    @Published var coordinator: FlightCoordinator
    @Published var flights : [String] = []
    private let useCase: FlightUseCase

    init(coordinator: FlightCoordinator, useCase: FlightUseCase) {
        self.coordinator = coordinator
        self.useCase = useCase
//        loadFlights()
    }
    
    func loadFlights() {
        flights = useCase.fetchFlights()
    }
    
    func goToList() {
        coordinator.navigate(to: .list(searchData: flights))
    }
    
    func goToBack() { coordinator.goToHome() }
}




