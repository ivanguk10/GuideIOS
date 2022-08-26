//
//  GuideIOSApp.swift
//  GuideIOS
//
//  Created by MacBookPro on 26/08/2022.
//

import SwiftUI

@main
struct GuideIOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
