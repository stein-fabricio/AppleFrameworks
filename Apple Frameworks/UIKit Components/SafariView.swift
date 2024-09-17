//
//  SafariView.swift
//  Apple Frameworks
//
//  Created by Stein on 05/09/24.
//

import SwiftUI
import SafariServices

// dive in UIKit from SwiftUI
struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    /// default: func makeUIViewController(context: Context) -> some UIViewController {
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        // creates the body of our view
        SFSafariViewController(url: url)
    }
    
    /// default: func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) { }
    
}
