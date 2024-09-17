//
//  XDismissButton.swift
//  Apple Frameworks
//
//  Created by Stein on 12/09/24.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isShowingDetailView = false
            }, label: {
                DismissButton()
            })
        }
        .padding()
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
    XDismissButton(isShowingDetailView: .constant(false))
}
