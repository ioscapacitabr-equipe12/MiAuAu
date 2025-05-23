//
//  PetListViewModel.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 23/05/25.
//

import SwiftUI
import SwiftData

@Observable
class PetListViewModel {
    var pets: [Pet] = []
    var searchText: String = ""
    
    var filteredPets: [Pet] {
        if searchText.isEmpty {
            return pets
        } else {
            return pets.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func loadPets(from context: ModelContext) {
        let descriptor = FetchDescriptor<Pet>(sortBy: [SortDescriptor(\.name)])
        do {
            pets = try context.fetch(descriptor)
        } catch {
            print("Failed to fetch pets: \(error)")
        }
    }
    
    func deletePet(_ pet: Pet, from context: ModelContext) {
        context.delete(pet)
        try? context.save()
        loadPets(from: context)
    }
}
