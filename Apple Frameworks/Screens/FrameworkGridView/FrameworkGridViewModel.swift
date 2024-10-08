//
//  FrameworkGridViewModel.swift
//  Apple Frameworks
//
//  Created by Stein on 03/09/24.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject { // -> MVVM
    
    /* iOS16<
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
     
      */
    @Published var isShowingDetailView: Bool = false
    @Published var isUsingListFormat: Bool = false
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
