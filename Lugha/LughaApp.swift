//
//  LughaApp.swift
//  Lugha
//
//  Created by Michael Amiro on 21/08/2021.
//

import SwiftUI
//import Firebase

@main
struct LughaApp: App {
    let persistenceController = PersistenceController.shared

    init () {
//        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LessonListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
