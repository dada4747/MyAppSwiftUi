//
//  FlightSearchView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI


struct FlightSearchView: View {
    @ObservedObject var viewModel: FlightSearchViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Flight Search")
            Button("List") { viewModel.goToList() }
            Button("Back") { viewModel.goToBack() }
//            Button("back")
        }
        .padding()
        .onAppear {
                    if viewModel.flights.isEmpty {
                        viewModel.loadFlights()
                    }
                }
    }
}
