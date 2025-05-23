//
//  MiAuAuApp.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 16/05/25.
//

import SwiftUI
import SwiftData

@main
struct MiAuAuApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Pet.self, Owner.self, Medication.self, Note.self])
    }
}
