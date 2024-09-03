//
//  FrameworkGridViewModel.swift
//  Apple Frameworks
//
//  Created by Stein on 03/09/24.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject { // -> MVVM
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView: Bool = false
}
