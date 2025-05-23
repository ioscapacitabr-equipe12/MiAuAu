//
//  PetDetailView.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 23/05/25.
//
import SwiftUI

struct PetDetailView: View {
    let pet: Pet
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(pet.name)
                            .font(.largeTitle)
                            .bold()
                        
                        HStack {
                            Text(pet.species.emoji)
                            Text(pet.species.rawValue)
                            Text("•")
                            Text(pet.gender.emoji)
                            Text(pet.gender.rawValue)
                        }
                        .font(.title2)
                        .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Basic Information")
                        .font(.headline)
                    
                    InfoRow(label: "Breed", value: pet.breed.displayName)
                    InfoRow(label: "Color", value: pet.color.rawValue)
                    InfoRow(label: "Age", value: "\(pet.age) years")
                    InfoRow(label: "Weight", value: "\(pet.weight) kg")
                    InfoRow(label: "Birth Date", value: pet.birthDate.formatted(date: .abbreviated, time: .omitted))
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Health Information")
                        .font(.headline)
                    
                    HStack {
                        Label(pet.isNeutered ? "Neutered/Spayed" : "Not Neutered/Spayed", 
                              systemImage: pet.isNeutered ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(pet.isNeutered ? .green : .red)
                    }
                    
                    HStack {
                        Label(pet.isVaccinated ? "Vaccinated" : "Not Vaccinated", 
                              systemImage: pet.isVaccinated ? "checkmark.shield.fill" : "xmark.shield.fill")
                        .foregroundColor(pet.isVaccinated ? .green : .red)
                    }
                    
                    if !pet.allergies.isEmpty {
                        InfoRow(label: "Allergies", value: pet.allergies)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                if let owner = pet.owner {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Owner Information")
                            .font(.headline)
                        
                        InfoRow(label: "Owner", value: owner.name)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(pet.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    
                } label: {
                    Image(systemName: "note.text.badge.plus")
                }
                
            }
            ToolbarItem {
                Button {
                    
                } label: {
                    Image(systemName: "medical.thermometer")
                }
            }        }
    }
}
