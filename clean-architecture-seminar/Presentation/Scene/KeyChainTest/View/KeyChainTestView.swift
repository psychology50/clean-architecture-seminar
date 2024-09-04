//
//  KeyChainTestView.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/4/24.
//

import SwiftUI

struct KeyChainTestView: View {
    
    @StateObject private var viewModel = KeyChainTestViewModel()

    var body: some View {
        VStack {
            
            Button("Save Token") {
                viewModel.saveToken("example_token_123")
            }
            
            Button("Load Token") {
                viewModel.loadToken()
            }
            
            Button("Delete Token") {
                viewModel.deleteToken()
            }
        }
        .padding()
    }
}
