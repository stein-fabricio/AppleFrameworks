//
//  BackgroundView.swift
//  Apple Frameworks
//
//  Created by Stein on 03/09/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ContainerRelativeShape()
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
