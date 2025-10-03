//
//  HistoryView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 24/09/25.
//

import Foundation
import SwiftUI

struct HistoryView: View {
    @State var navToSettings: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            
           // MARK: - Header Section
            
            HStack {
              
                Text("History")
                    .font(FontManager.bricolageGrotesqueBoldFont(size: .scaledFontSize(25.56818)))
                    .foregroundColor(Color.primaryApp)
                
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
            
            
            EmptyView()
            
            
            Spacer()
            
            
        }
        .background {
            Image(.background)
                .resizable()
                .scaledToFill()

        }
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
