//
//  cardView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 26/09/25.
//

import Foundation
import SwiftUI

struct CardView : View {
    
    var imageName: String
    
    var body: some View {
            
            Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 335, height: 130)
            .clipped()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white.opacity(0.2), lineWidth: 1)
            )
            
        
    }
}
