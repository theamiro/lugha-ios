//
//  LughaApp.swift
//  Lugha
//
//  Created by Michael Amiro on 21/08/2021.
//

import SwiftUI

@main
struct LughaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
