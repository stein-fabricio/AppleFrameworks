//
//  DetailView.swift
//  Apple Frameworks
//
//  Created by Stein on 03/09/24.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            VStack {
                //iOS16<
                /*
                if !isUsingListFormat {
                    XDismissButton(isShowingDetailView: $viewModel.isShowingDetailView.wrappedValue)
                }
                
                Spacer()
                     */
                
                FrameworkIconTextView(framework: viewModel.framework, isUsingListFormat: $viewModel.isUsingListFormat)
                
                Text(viewModel.framework.description)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                // outside:
                Link(destination: URL(string: viewModel.framework.urlString)!) {
                    Label("Learn More", systemImage: "book.fill")
                }
                
                // inside:
//                Button {
//                    viewModel.isShowingSafariView = true
//                    ///SafariView(url: URL(string: framework.urlString)!)
//                } label: {
//                    // iOS15
//                    Label("Learn More", systemImage: "book.fill")
//                    // iOS15-
////                                         AFButton(title: "Learn More")
//                }
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
                
//                .fullScreenCover(isPresented: $viewModel.isShowingSafariView, content: {
//                    SafariView(url: (URL(string: viewModel.framework.urlString) ?? URL(string: "www.apple.com"))!)
//                })
            }
        }
    }
}

//#Preview {
//    DetailView(framework: MockData.sampleFramework, isUsingListFormat: .constant(false))//isShowingDetailView: .constant(true), isUsingListFormat: .constant(false))
//        .preferredColorScheme(.dark)
//}
