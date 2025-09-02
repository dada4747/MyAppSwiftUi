//
//  FlightRepositoryImpl.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class FlightRepositoryImpl: FlightRepository {
    private let service: FlightService

    init(service: FlightService) {
        self.service = service
    }

    func fetchFlights() -> [String] {
        return service.fetchFlights()
    }
}
