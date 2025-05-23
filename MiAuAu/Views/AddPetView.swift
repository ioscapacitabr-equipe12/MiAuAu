//
//  AddPetView.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 21/05/25.
//

import SwiftUI
import SwiftData

struct AddPetView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = AddPetViewModel()
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @Binding var refreshTrigger: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Basic Information")) {
                    TextField("Pet Name", text: $viewModel.name)
                    
                    Picker("Species", selection: $viewModel.species) {
                        ForEach(Specie.allCases, id: \.self) { species in
                            HStack {
                                Text(species.emoji)
                                Text(species.rawValue)
                            }.tag(species)
                        }
                    }
                    
                    if viewModel.species == .dog {
                        Picker("Breed", selection: $viewModel.selectedDogBreed) {
                            ForEach(Breed.DogBreed.allCases, id: \.self) { breed in
                                Text(breed.rawValue).tag(breed)
                            }
                        }
                    } else {
                        Picker("Breed", selection: $viewModel.selectedCatBreed) {
                            ForEach(Breed.CatBreed.allCases, id: \.self) { breed in
                                Text(breed.rawValue).tag(breed)
                            }
                        }
                    }
                    
                    Picker("Gender", selection: $viewModel.gender) {
                        ForEach(Gender.allCases, id: \.self) { gender in
                            HStack {
                                Text(gender.emoji)
                                Text(gender.rawValue)
                            }.tag(gender)
                        }
                    }
                    
                    DatePicker("Birth Date", selection: $viewModel.birthDate, displayedComponents: .date)
                }
                
                Section(header: Text("Physical Details")) {
                    TextField("Weight (kg)", text: $viewModel.weight)
                        .keyboardType(.decimalPad)
                    
                    TextField("Age (years)", text: $viewModel.age)
                        .keyboardType(.numberPad)
                    
                    Picker("Color", selection: $viewModel.color) {
                        ForEach(PetColor.allCases, id: \.self) { color in
                            Text(color.rawValue).tag(color)
                        }
                    }
                }
                
                Section(header: Text("Health Information")) {
                    Toggle("Neutered/Spayed", isOn: $viewModel.isNeutered)
                    Toggle("Vaccinated", isOn: $viewModel.isVaccinated)
                    
                    TextField("Allergies (comma separated)", text: $viewModel.allergies)
                }
                
                Section(header: Text("Owner Information")) {
                    TextField("Owner Name (optional)", text: $viewModel.ownerName)
                }
            }
            .navigationTitle("Add New Pet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Seguinte") {
                        if viewModel.savePet(to: modelContext) {
                            alertMessage = "Pet saved successfully!"
                            showingAlert = true
                            viewModel.reset()
                            refreshTrigger.toggle() // Trigger refresh
                        } else {
                            alertMessage = "Please fill in the required fields."
                            showingAlert = true
                        }
                    }
                    .disabled(!viewModel.isFormValid)
                }
            }
            .alert("Pet Management", isPresented: $showingAlert) {
                Button("OK") {
                    dismiss()
                }
            } message: {
                Text(alertMessage)
            }
        }
    }
}
