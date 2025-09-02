//
//  FlightDetailViewModel.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class FlightDetailViewModel: ObservableObject {
    @Published var coordinator: FlightCoordinator
    var selectedFlight: String

    init(coordinator: FlightCoordinator, selectedFlight: String) {
        self.coordinator = coordinator
        self.selectedFlight = selectedFlight
    }

    func goToBook() { coordinator.navigate(to: .book(selectedFlight: selectedFlight)) }
    func goBack() { coordinator.goBack()}
}
