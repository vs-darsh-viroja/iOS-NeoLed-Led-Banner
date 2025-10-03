//
//  EmptyView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 02/10/25.
//

import Foundation
import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
                .frame(height: ScaleUtility.scaledValue(167))
         
            VStack(spacing: ScaleUtility.scaledSpacing(31)) {
                
                Image(.emptyIcon)
                    .resizable()
                    .frame(width: ScaleUtility.scaledValue(150), height: ScaleUtility.scaledValue(150))
                
                Text("No Banners Yet!")
                    .font(FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(20)))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.primaryApp.opacity(0.5))
    
            }
            
        }

    }
}
