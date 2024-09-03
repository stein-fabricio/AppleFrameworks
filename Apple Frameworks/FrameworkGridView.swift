//
//  FrameworkGridView.swift
//  Apple Frameworks
//
//  Created by Stein on 03/09/24.
//

import Foundation
import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel() // MVVM
    /// FrameworkGridView will get destroyed and created all the time, but a StateObject will be kept
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, content: {
                        ForEach(MockData.frameworks) { framework in
                            FrameworkIconTextView(framework: framework)
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                        }
                    })
                    .navigationTitle("🍎 Frameworks")
                    .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                        DetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView) /// oops could not find.
                    })
                }
            }
        }
    }
}


#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}
