//
//  FlightBookView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct FlightBookView: View {
    @ObservedObject var viewModel: FlightBookViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Flight Book: \(viewModel.selectedFlight)")
            Button("Success") { viewModel.goToSuccess() }
            Button("Failed") { viewModel.goToFailed() }
            Button("Back") { viewModel.goBack() }
        }
        .padding()
    }
}
