//
//  FlightUseCase.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class FlightUseCase {
    private let repository: FlightRepository

    init(repository: FlightRepository) {
        self.repository = repository
    }

    func fetchFlights() -> [String]{
        return repository.fetchFlights()
    }
}
