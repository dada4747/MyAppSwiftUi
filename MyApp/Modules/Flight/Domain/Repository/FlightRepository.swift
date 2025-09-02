//
//  FlightRepository.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

protocol FlightRepository {
    func fetchFlights() -> [String]
}
