//
//  HeaderView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 26/09/25.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    
    @State var navToSettings: Bool = false
    
    var body: some View {
        HStack {
            Image(.appTitle)
                .resizable()
                .frame(width: ScaleUtility.scaledValue(120) ,height: ScaleUtility.scaledValue(20))
        
            Spacer()
            
            HStack(spacing: ScaleUtility.scaledSpacing(12)) {
                
                Image(.crownIcon)
                    .resizable()
                    .frame(width: ScaleUtility.scaledValue(20.45455), height: ScaleUtility.scaledValue(20.45455))
                    .padding(.all, ScaleUtility.scaledSpacing(6.77))
                    .background(Color.clear)
                    .overlay(
                        Circle()
                            .stroke(Color.accent, lineWidth: 1)
                    )
                
                Button {
                    navToSettings = true
                } label: {
                    Image(.settingIcon)
                        .resizable()
                        .frame(width: ScaleUtility.scaledValue(19.57641), height: ScaleUtility.scaledValue(20))
                        .padding(.all, ScaleUtility.scaledSpacing(8))
                        .background{
                            Circle()
                                .fill( Color.primaryApp.opacity(0.1))
                           
                        }
                }

                
  
            }
        }
        .padding(.horizontal, ScaleUtility.scaledSpacing(20))
        .padding(.top, ScaleUtility.scaledSpacing(62))
        .navigationDestination(isPresented: $navToSettings) {
            SettingsView {
                navToSettings = false
            }
            .background {
                Image(.background)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
            }
        }
    }
}
