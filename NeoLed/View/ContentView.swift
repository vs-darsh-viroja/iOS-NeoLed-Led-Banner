//
//  ContentView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 24/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userDefault: UserSettings
    
    var body: some View {
        ZStack {
            if userDefault.hasFinishedOnboarding {
                MainView()
            }
            else {
                SwipeView(showPaywall: {
                    //                if !purchaseManager.hasPro && remoteConfigManager.isShowOnboardingPaywall {
                    //                    userDefault.hasShownPaywall = true
                    //                }
                    //                else {
                    //                    userDefault.hasFinishedOnboarding = true
                    //                }
                    userDefault.hasFinishedOnboarding = true
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
