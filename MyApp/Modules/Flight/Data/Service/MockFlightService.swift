//
//  MockFlightService.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class MockFlightService: FlightService {
    private let client: NetworkClient
    
    init(baseURL: String) {
        self.client = NetworkClient(baseURL: baseURL)
    }
    
    func fetchFlights()->[String] {
        // For mock, still call the mock base URL
        client.get(path: "/flights/mock")
        print("Your are calling from mock")
        return ["DXB-SFO", "DXB-BOM", "DXB-DEL"]
    }
}
