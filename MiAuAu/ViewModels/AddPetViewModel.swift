//
//  AddPetViewModel.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 23/05/25.
//
import SwiftUI
import SwiftData

@Observable
class AddPetViewModel {
    var name: String = ""
    var species: Specie = .dog
    var selectedDogBreed: Breed.DogBreed = .mixedBreed
    var selectedCatBreed: Breed.CatBreed = .mixedBreed
    var gender: Gender = .male
    var weight: String = ""
    var age: String = ""
    var color: PetColor = .mixed
    var isNeutered: Bool = false
    var isVaccinated: Bool = false
    var birthDate: Date = Date()
    var allergies: String = ""
    var ownerName: String = ""
    
    var breed: Breed {
        switch species {
        case .dog:
            return .dogBreed(selectedDogBreed)
        case .cat:
            return .catBreed(selectedCatBreed)
        }
    }
    
    var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func savePet(to context: ModelContext) -> Bool {
        guard isFormValid else { return false }
        
        let owner = ownerName.trimmingCharacters(in: .whitespaces).isEmpty ? nil : Owner(name: ownerName)
        
        let pet = Pet(
            name: name.trimmingCharacters(in: .whitespaces),
            species: species,
            breed: breed,
            gender: gender,
            weight: Float(weight) ?? 0.0,
            age: Int(age) ?? 0,
            color: color,
            isNeutered: isNeutered,
            isVaccinated: isVaccinated,
            birthDate: birthDate,
            allergies: [allergies],
            owner: owner
        )
        
        context.insert(pet)
        
        do {
            try context.save()
            return true
        } catch {
            print("Failed to save pet: \(error)")
            return false
        }
    }
    
    func reset() {
        name = ""
        species = .dog
        selectedDogBreed = .mixedBreed
        selectedCatBreed = .mixedBreed
        gender = .male
        weight = ""
        age = ""
        color = .mixed
        isNeutered = false
        isVaccinated = false
        birthDate = Date()
        allergies = ""
        ownerName = ""
    }
}
