//
//  HomeView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home Screen")
            Button("Go to User") { viewModel.goToUser() }
            Button("Go to Product"){viewModel.goToProduct()}
            Button("Go to Flight") { viewModel.goToFlight() }
        }
        .padding()
    }
}
