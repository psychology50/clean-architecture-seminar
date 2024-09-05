//
//  clean_architecture_seminarApp.swift
//  clean-architecture-seminar
//
//  Created by 양재서 on 9/2/24.
//

import SwiftUI

@main
struct clean_architecture_seminarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ProfileMainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
