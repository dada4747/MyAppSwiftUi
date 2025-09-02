//
//  FlightBookViewModel.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class FlightBookViewModel: ObservableObject {
    @Published var coordinator: FlightCoordinator
    var selectedFlight: String

    init(coordinator: FlightCoordinator, selectedFlight: String) {
        self.coordinator = coordinator
        self.selectedFlight = selectedFlight
    }

    func goToSuccess() { coordinator.navigate(to: .success) }
    func goToFailed() { coordinator.navigate(to: .failed) }
    func goBack() { coordinator.goBack() }
}
