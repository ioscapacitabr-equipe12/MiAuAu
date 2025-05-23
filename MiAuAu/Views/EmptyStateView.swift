//
//  EmptyStateView.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 23/05/25.
//
import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "pawprint.fill")
                .font(.system(size: 60))
                .foregroundColor(.secondary)
            
            Text("No pets yet")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Text("Add your first pet using the + tab")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
