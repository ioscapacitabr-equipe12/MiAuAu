//
//  InfoRow.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 23/05/25.
//
import SwiftUI

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .bold()
        }
    }
}
