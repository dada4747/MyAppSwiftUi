//
//  FlightFailedView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct FlightFailedView: View {
    @ObservedObject var viewModel: FlightFailedViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Booking Failed!")
            Button("Home") { viewModel.goToHome() }
        }
        .padding()
    }
}
