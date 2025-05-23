//
//  Enums.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 16/05/25.
//

import SwiftUI

enum Breed: Codable {
    case dogBreed(DogBreed)
    case catBreed(CatBreed)
    
    enum DogBreed: String, CaseIterable, Codable {
        case labradorRetriever = "Labrador Retriever"
        case poodle = "Poodle"
        case bulldog = "Bulldog"
        case germanShepherd = "German Shepherd"
        case goldenRetriever = "Golden Retriever"
        case chihuahua = "Chihuahua"
        case shihTzu = "Shih Tzu"
        case mixedBreed = "Mixed Breed"
    }
    
    enum CatBreed: String, CaseIterable, Codable {
        case persian = "Persian"
        case siamese = "Siamese"
        case maineCoon = "Maine Coon"
        case sphynx = "Sphynx"
        case angora = "Angora"
        case bengal = "Bengal"
        case mixedBreed = "Mixed Breed"
    }
    
    var displayName: String {
        switch self {
        case .dogBreed(let breed):
            return breed.rawValue
        case .catBreed(let breed):
            return breed.rawValue
        }
    }
}

enum Specie: String, CaseIterable, Codable {
    case dog = "Dog"
    case cat = "Cat"
    
    var emoji: String {
        switch self {
        case .dog: return "🐕"
        case .cat: return "🐱"
        }
    }
}

enum Gender: String, CaseIterable, Codable {
    case male = "Male"
    case female = "Female"
    
    var emoji: String {
        switch self {
        case .male: return "♂️"
        case .female: return "♀️"
        }
    }
}

enum PetColor: String, CaseIterable, Codable {
    case black = "Black"
    case white = "White"
    case brown = "Brown"
    case gray = "Gray"
    case golden = "Golden"
    case cream = "Cream"
    case tan = "Tan"
    case red = "Red"
    case blue = "Blue"
    case orange = "Orange"
    case brindle = "Brindle"
    case merle = "Merle"
    case spotted = "Spotted"
    case tricolor = "Tricolor"
    case mixed = "Mixed"
}
