//
//  DetailView.swift
//  Apple Frameworks
//
//  Created by Stein on 03/09/24.
//

import SwiftUI

struct DetailView: View {
    
    let framework: Framework
    //iOS16
    
    //iOS16<
    /*
    @Binding var isShowingDetailView: Bool
     */
    @Binding var isUsingListFormat: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            VStack {
                //iOS16<
                /*
                if !isUsingListFormat {
                    XDismissButton(isShowingDetailView: $isShowingDetailView)
                }
                
                Spacer()
                     */
                
                FrameworkIconTextView(framework: framework, isUsingListFormat: $isUsingListFormat)
                
                Text(framework.description)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                Button {
                    isShowingSafariView = true
                    ///SafariView(url: URL(string: framework.urlString)!)
                } label: {
                    // iOS15
                    Label("Learn More", systemImage: "book.fill")
                    // iOS15-
//                    AFButton(title: "Learn More")
                }
                // iOS15:
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.red)
                /*
                .buttonStyle(.borderedProminent)
                .foregroundColor(.green)
                .buttonBorderShape(.capsule)
                .buttonBorderShape(.roundedRectangle(radius: 20))
                 */
                /// sheet(...
                .fullScreenCover(isPresented: $isShowingSafariView, content: {
                    SafariView(url: (URL(string: framework.urlString) ?? URL(string: "www.apple.com"))!)
                })
            }
        }
    }
}

#Preview {
    DetailView(framework: MockData.sampleFramework, isUsingListFormat: .constant(false))//isShowingDetailView: .constant(true), isUsingListFormat: .constant(false))
        .preferredColorScheme(.dark)
}
