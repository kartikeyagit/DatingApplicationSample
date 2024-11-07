//
//  HomeView.swift
//  AisleCodingAssessment
//
//  Created by Kartikeya Singh on 07/11/24.
//

import SwiftUI

struct HomeView: View {
    @State var viewModel: ApplicationViewModel
    @State var selectedIndex: Int = 1
    var body: some View {
        TabView(selection: $selectedIndex) {
            NavigationStack() {
                Text("Discover")
                    .navigationTitle("Discover")
            }
            .tabItem {
                Text("Discover")
                Image(systemName: "square.grid.2x2.fill")
                    .renderingMode(.template)
            }
            .tag(0)
            
            NavigationStack() {
                NotesView(viewModel: viewModel)
            }
            .tabItem {
                Label("Notes", systemImage: "envelope.fill")
            }
            .badge("9")
            .tag(1)
            
            NavigationStack() {
                Text("Matches")
                    .navigationTitle("About")
                
            }
            .tabItem {
                Text("Matches")
                Image(systemName: "message.fill")
                
            }
            .badge("50+")
            .tag(2)
            
            NavigationStack() {
                Text("Profile")
                    .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(3)
            
        }
        .accentColor(Color(hex: "8C5CFB"))
    }
}

#Preview {
    HomeView(viewModel: ApplicationViewModel())
}
