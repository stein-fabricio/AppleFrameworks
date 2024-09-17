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
    @Binding var isUsingListFormat: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            VStack {
                if !isUsingListFormat {
                    XDismissButton(isShowingDetailView: $isShowingDetailView)
                }
                
                Spacer()
                
                FrameworkIconTextView(framework: framework, isUsingListFormat: $isUsingListFormat)
                
                Text(framework.description)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                Button {
                    isShowingSafariView = true
                    ///SafariView(url: URL(string: framework.urlString)!)
                } label: {
                    AFButton(title: "Learn More")
                }
                /// sheet(...
                .fullScreenCover(isPresented: $isShowingSafariView, content: {
                    SafariView(url: (URL(string: framework.urlString) ?? URL(string: "www.apple.com"))!)
                })
            }
        }
    }
}

#Preview {
    DetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(true), isUsingListFormat: .constant(false))
        .preferredColorScheme(.dark)
}
