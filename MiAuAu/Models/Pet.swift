//
//  Pet.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 16/05/25.
//

import SwiftData
import Foundation

@Model
class Medication {
    var name: String
    var purpose: String
    var createdAt: Date

    init(name: String, purpose: String, createdAt: Date = Date()) {
        self.name = name
        self.purpose = purpose
        self.createdAt = createdAt
    }
}

@Model
class Note {
    var title: String
    var desc: String
    var createdAt: Date

    init(title: String, description: String, createdAt: Date = Date()) {
        self.title = title
        self.desc = description
        self.createdAt = createdAt
    }
}

@Model
class Owner {
    var name: String

    init(name: String) {
        self.name = name
    }
}

@Model
class Pet {
    var name: String
    var species: Specie
    var breed: Breed
    var gender: Gender
    var weight: Float
    var age: Int
    var color: PetColor
    var isNeutered: Bool
    var isVaccinated: Bool
    var birthDate: Date

    var allergies: String

    @Relationship(deleteRule: .cascade)
    var medications: [Medication] = []

    @Relationship(deleteRule: .cascade)
    var notes: [Note] = []

    @Relationship
    var owner: Owner?

    init(
        name: String,
        species: Specie,
        breed: Breed,
        gender: Gender,
        weight: Float,
        age: Int,
        color: PetColor,
        isNeutered: Bool,
        isVaccinated: Bool,
        birthDate: Date,
        allergies: [String],
        owner: Owner? = nil
    ) {
        self.name = name
        self.species = species
        self.breed = breed
        self.gender = gender
        self.weight = weight
        self.age = age
        self.color = color
        self.isNeutered = isNeutered
        self.isVaccinated = isVaccinated
        self.birthDate = birthDate
        self.allergies = allergies.joined(separator: ", ")
        self.owner = owner
    }

    var allergyArray: [String] {
        get { allergies.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) } }
        set { allergies = newValue.joined(separator: ", ") }
    }
}
