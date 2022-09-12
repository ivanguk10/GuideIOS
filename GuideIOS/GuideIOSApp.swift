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
            WindowReader { window in
                ContentView()
                    .rootView(navigation: Navigation(window: window))
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
