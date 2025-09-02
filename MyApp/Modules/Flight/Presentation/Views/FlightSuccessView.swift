//
//  FlightSuccessView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct FlightSuccessView: View {
    @ObservedObject var viewModel: FlightSuccessViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Booking Success!")
            Button("Home") { viewModel.goToHome() }
        }
        .padding()
    }
}

