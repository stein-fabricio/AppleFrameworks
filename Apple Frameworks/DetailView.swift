//
//  DetailView.swift
//  Apple Frameworks
//
//  Created by Stein on 03/09/24.
//

import SwiftUI

struct DetailView: View {
    
    let framework: Framework
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            VStack {
                
                HStack {
                    Spacer()
                    Button(action: {
                        isShowingDetailView = false
                    }, label: {
                        DismissButton()
                    })
                }
                
                Spacer()
                
                FrameworkIconTextView(framework: framework)
                
                Text(framework.description)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    AFButton(title: "Learn More")
                })
                
            }
        }
    }
}

struct DismissButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .foregroundColor(Color(.label))
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .padding()
    }
}

#Preview {
    DetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
        .preferredColorScheme(.dark)
}
