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
    
    var body: some View {
        if !viewModel.isUsingListFormat {
            GridView(viewModel: viewModel)
        } else {
            ListView(viewModel: viewModel)
        }
    }
}


#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}

struct GridView: View {
    @StateObject var viewModel: FrameworkGridViewModel
    var body: some View {
        // iOS16: Data driven API
        NavigationStack {
//        ZStack {
//            NavigationView {
                ScrollView {
                    LazyVGrid(columns: viewModel.columns, content: {
                        ForEach(MockData.frameworks) { framework in
                            NavigationLink(value: framework) {
                                FrameworkIconTextView(framework: framework,
                                                      isUsingListFormat: .constant(false))
                            }
                            /* iOS16<
                            FrameworkIconTextView(framework: framework,
                                                  isUsingListFormat: .constant(false))
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                             */
                        }
                    })
                    .navigationTitle("🍎 Frameworks")
                    //iOS16:
                    .navigationDestination(for: Framework.self) { framework in
                        DetailView(framework: framework,
                                   isUsingListFormat: $viewModel.isUsingListFormat)
                    }
                    /* iOS16<
                    .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                        DetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                                   isShowingDetailView: $viewModel.isShowingDetailView,
                                   isUsingListFormat: $viewModel.isUsingListFormat) /// oops could not find.
                    })
                     */
                }
//            }
        }
    }
}

struct ListView: View {
    @StateObject var viewModel: FrameworkGridViewModel
    var body: some View {
        // iOS16:
        NavigationStack {
//        NavigationView {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(value: framework) {
                        FrameworkIconTextView(framework: framework,
                                              isUsingListFormat: .constant(false))
                    }
                    /* iOS16<
                    NavigationLink(destination: DetailView(framework: framework,
                                                           isShowingDetailView: $viewModel.isShowingDetailView,
                                                           isUsingListFormat: $viewModel.isUsingListFormat)) {
                     
                        FrameworkIconTextView(framework: framework, isUsingListFormat: .constant(true))
                     
                    }*/
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label)) // color back button
    }
}
