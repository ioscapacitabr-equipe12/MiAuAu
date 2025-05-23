//
//  ContentView.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 16/05/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showingAddPet = false
    @State private var refreshTrigger = false
    
    var body: some View {
        TabView {
            PetListView(showingAddPet: $showingAddPet, refreshTrigger: $refreshTrigger)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Pets")
                }
        }
        .sheet(isPresented: $showingAddPet) {
            AddPetView(refreshTrigger: $refreshTrigger)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Pet.self, Owner.self, Medication.self, Note.self])
}
