//
//  RootView.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/11/24.
//

import SwiftUI

struct RootView: View {
    private let profileFactory: any ProfileFactory
    
    init(
        profileFactory: any ProfileFactory
    ) {
        self.profileFactory = profileFactory
    }
    
    var body: some View {
        Group {
            profileFactory.makeProfileView()
                .eraseToAnyView()
        }
    }
}

public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
