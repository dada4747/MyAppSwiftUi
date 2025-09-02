//
//  FlightListViewModel.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class FlightListViewModel: ObservableObject {
    @Published var coordinator: FlightCoordinator
    var searchResults: [String]

    init(coordinator: FlightCoordinator, searchResults: [String]) {
        self.coordinator = coordinator
        self.searchResults = searchResults
    }

    func goToDetail(selectedFlight: String) {
        coordinator.navigate(to: .detail(selectedFlight: selectedFlight))
    }
    
    func goBack() { coordinator.goBack() }
    func goToDetail(){ coordinator.navigate(to: .detail(selectedFlight: "details")) }
}
