//
//  NeoLedApp.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 24/09/25.
//

import SwiftUI

@main
struct NeoLedApp: App {
    @StateObject private var userSettings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userSettings)
        }
    }
}
