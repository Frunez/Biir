//
//  BiirApp.swift
//  Biir
//
//  Created by Frank on 01/03/2021.
//

import SwiftUI

@main
struct BiirApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
