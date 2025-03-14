//
//  Lineargradient.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-13.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.brown, .red, .white]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}
