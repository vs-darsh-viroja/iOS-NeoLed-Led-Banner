//
//  MainView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 24/09/25.
//

import Foundation
import SwiftUI

enum TabSelection: Hashable {
    case explore
    case create
    case history
}


struct MainView: View {
    
    @State private var selectedTab: TabSelection = .explore
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Group {
                    switch selectedTab {
                    case .explore:
                        ExploreView()
                    case .create:
                       CreateView()
                    case .history:
                        HistoryView()
                    }
                }
                .frame(maxWidth:.infinity)
                .transition(.opacity)
                
                
                VStack {
                    Spacer()
      
                    
                    HStack {
                        
                        Button {
                            selectedTab = .explore
                        } label: {
                            VStack(spacing: ScaleUtility.scaledSpacing(4.88)) {
                                Image(.exploreIcon)
                                    .resizable()
                                    .frame(width: ScaleUtility.scaledValue(29.26829), height: ScaleUtility.scaledValue(29.26829))
                                
                                Text("Explore")
                                    .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.41463)))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .frame(width: ScaleUtility.scaledValue(85.36585))
                            }
                            .opacity(selectedTab != .explore ? 0.5 : 1)
                        }
                        
                        Spacer()
                        
                        Button {
                            selectedTab = .create
                        } label: {
                            VStack(spacing: ScaleUtility.scaledSpacing(4.88)) {
                                Image(.createIcon)
                                    .resizable()
                                    .frame(width: ScaleUtility.scaledValue(29.26829), height: ScaleUtility.scaledValue(29.26829))
                                
                                Text("Create")
                                    .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.41463)))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .frame(width: ScaleUtility.scaledValue(85.36585))
                            }
                            .opacity(selectedTab != .create ? 0.5 : 1)
                        }
                        
                        Spacer()
                        
                        Button {
                            selectedTab = .history
                        } label: {
                            VStack(spacing: ScaleUtility.scaledSpacing(4.88)) {
                                Image(.historyIcon)
                                    .resizable()
                                    .frame(width: ScaleUtility.scaledValue(29.26829), height: ScaleUtility.scaledValue(29.26829))
                                
                                Text("History")
                                    .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.41463)))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .frame(width: ScaleUtility.scaledValue(84))
                            }
                            .opacity(selectedTab != .history ? 0.5 : 1)
                        }
                    }
                    .padding(.horizontal, ScaleUtility.scaledSpacing(34))
                    .padding(.bottom, ScaleUtility.scaledSpacing(10))
                    .frame(height: ScaleUtility.scaledValue(97))
                    .background {
                        Image(.tabBg)
                            .resizable()
                            .frame(height: ScaleUtility.scaledValue(97))
                            .frame(maxWidth:.infinity)
                    }
                    .cornerRadius(10)
                }
    
            }
            .ignoresSafeArea(.all)
        }
    }
}
