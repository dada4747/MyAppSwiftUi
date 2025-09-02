//
//  FlightFailedViewModel.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class FlightFailedViewModel: ObservableObject {
    @Published var coordinator: FlightCoordinator
    init(coordinator: FlightCoordinator) { self.coordinator = coordinator }
    func goToHome() { coordinator.goToHome() }
}
