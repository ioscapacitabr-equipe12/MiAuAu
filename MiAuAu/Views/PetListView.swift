//
//  PetListView.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 23/05/25.
//

import SwiftUI
import SwiftData

struct PetListView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = PetListViewModel()
    @Binding var showingAddPet: Bool
    @Binding var refreshTrigger: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.filteredPets.isEmpty {
                    EmptyStateView()
                } else {
                    List {
                        ForEach(viewModel.filteredPets, id: \.name) { pet in
                            NavigationLink(destination: PetDetailView(pet: pet)) {
                                PetRowView(pet: pet)
                            }
                        }
                        .onDelete(perform: deletePets)
                    }
                }
            }
            .navigationTitle("My Pets")
            .searchable(text: $viewModel.searchText, prompt: "Buscar Pet")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAddPet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .onAppear {
                viewModel.loadPets(from: modelContext)
            }
            .onChange(of: refreshTrigger) { _ in
                viewModel.loadPets(from: modelContext)
            }
        }
    }
    
    private func deletePets(offsets: IndexSet) {
        for index in offsets {
            let pet = viewModel.filteredPets[index]
            viewModel.deletePet(pet, from: modelContext)
        }
    }
}
