//
//  View+navigate.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/12/24.
//

import SwiftUI

public extension View {
    func navigate(
        to view: some View,
        when binding: Binding<Bool>,
        isDetailLink: Bool = false
    ) -> some View {
        self.background (
            NavigationLink(isActive: binding) {
                DeferView {
                    view
                }
            } label: {
                EmptyView()
            }
            .isDetailLink(isDetailLink)
        )
    }
}

public struct DeferView<Content: View>: View {
    let content: () -> Content

    public init(
        @ViewBuilder _ content: @escaping () -> Content
    ) {
        self.content = content
    }

    public var body: some View {
        content()
            .onAppear {
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil,
                    from: nil,
                    for: nil
                )
            }
    }
}
