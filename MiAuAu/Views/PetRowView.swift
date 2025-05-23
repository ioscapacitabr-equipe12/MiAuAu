//
//  PetRowView.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 23/05/25.
//
import SwiftUI
import SwiftData

struct PetRowView: View {
    let pet: Pet
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(pet.name)
                        .font(.headline)
                    Text(pet.species.emoji)
                    Text(pet.gender.emoji)
                }
                
                Text("\(pet.species.rawValue) • \(pet.breed.displayName)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                if let owner = pet.owner {
                    Text("Owner: \(owner.name)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                if pet.isVaccinated {
                    Image(systemName: "checkmark.shield")
                        .foregroundColor(.green)
                }
                if pet.isNeutered {
                    Image(systemName: "scissors")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.vertical, 2)
    }
}
