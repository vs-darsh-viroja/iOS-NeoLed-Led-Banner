//
//  ContentView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 24/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            SwipeView(showPaywall: {
//                if !purchaseManager.hasPro && remoteConfigManager.isShowOnboardingPaywall {
//                    userDefault.hasShownPaywall = true
//                }
//                else {
//                    userDefault.hasFinishedOnboarding = true
//                }
            })
        }
    }
}

#Preview {
    ContentView()
}
