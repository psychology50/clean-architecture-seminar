//
//  View+eraseToAnyView.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/12/24.
//

import SwiftUI

public extension View {
    func wrapAnyView() -> AnyView {
        AnyView(self)
    }
}
