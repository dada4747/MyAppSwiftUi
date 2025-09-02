//
//  FlightDetailView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct FlightDetailView: View {
    @ObservedObject var viewModel: FlightDetailViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Flight Detail: \(viewModel.selectedFlight)")
            Button("Book") { viewModel.goToBook() }
            Button("Back") { viewModel.goBack() }
        }
        .padding()
    }
}
