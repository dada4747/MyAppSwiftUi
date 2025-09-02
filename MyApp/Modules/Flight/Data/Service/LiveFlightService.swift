//
//  LiveFlightService.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class LiveFlightService: FlightService {
    private let client: NetworkClient
    
    init(baseURL: String) {
        self.client = NetworkClient(baseURL: baseURL)
    }
    
    func fetchFlights()->[String] {
        // For live, call the live API
        client.get(path: "/flights")
        print("Your are calling from Live")
        return ["Blr-SFO", "Blr-BOM", "Blr-DEL"]
    }
}

