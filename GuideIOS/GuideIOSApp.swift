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
//    @ObservedObject private var navigation: Navigation = Navigation()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                .environmentObject(navigation)
        }
    }
}
