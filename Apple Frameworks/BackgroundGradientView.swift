//
//  BackgroundGradientView.swift
//  Apple Frameworks
//
//  Created by Stein on 03/09/24.
//

import SwiftUI

struct BackgroundGradientView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        LinearGradient(colors:
                        colorScheme == .dark ? [.gray, .black] : [.white, .gray],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    Group {
        BackgroundGradientView()
            .preferredColorScheme(.light) // Light mode preview
        BackgroundGradientView()
            .preferredColorScheme(.dark) // Dark mode preview
    }
}
