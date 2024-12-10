//
//  FrameworkDetailViewModel.swift
//  Apple Frameworks
//
//  Created by Fabricio Stein on 10/12/24.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    
    let framework: Framework
    var isShowingDetailView: Binding<Bool>
    @Published var isShowingSafariView = false
    //iOS16
    
    //iOS16<
    /*
    @Binding var isShowingDetailView: Bool
     */
    @Published var isUsingListFormat = false
//    @State private var isShowingSafariView = false
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>, isUsingListFormat: Bool) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
        self.isUsingListFormat = isUsingListFormat
    }
}
