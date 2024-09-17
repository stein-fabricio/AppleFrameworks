//
//  FrameworkIconTextView.swift
//  Apple Frameworks
//
//  Created by Stein on 03/09/24.
//

import SwiftUI

struct FrameworkIconTextView: View {
    
    let framework: Framework
    @Binding var isUsingListFormat: Bool
    
    var body: some View {
        if !isUsingListFormat {
            VStack {
                Image(framework.imageName)
                    .resizable()
                    .frame(width: 90, height: 90)
                Text(framework.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
            }
            .padding()
        } else {
            HStack {
                Image(framework.imageName)
                    .resizable()
                    .frame(width: 70, height: 70)
                Text(framework.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                    .padding()
            }
        }
    }
}

#Preview {
    FrameworkIconTextView(framework: MockData.sampleFramework, isUsingListFormat: .constant(false))
}
