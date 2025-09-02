//
//  FlightListView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct FlightListView: View {
    @ObservedObject var viewModel: FlightListViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Flight List")
            ForEach(viewModel.searchResults, id: \.self) { flight in
                Button(flight) { viewModel.goToDetail(selectedFlight: flight) }
            }
//            Button("Detaiks") {viewModel.goToDetail() }

            Button("Back") { viewModel.goBack() }
        }
        .padding()
    }
}
