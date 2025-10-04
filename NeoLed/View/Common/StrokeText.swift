//
//  StrokeText.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 01/10/25.
//

import Foundation
import SwiftUI


struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color
    let font: Font
    let fontWeight: Font.Weight
    let isItalic: Bool  // ADD THIS NEW PARAMETER
    
    // ADD THIS INITIALIZER for backward compatibility
    init(text: String, width: CGFloat, color: Color, font: Font, fontWeight: Font.Weight, isItalic: Bool = false) {
        self.text = text
        self.width = width
        self.color = color
        self.font = font
        self.fontWeight = fontWeight
        self.isItalic = isItalic
    }

    var body: some View {
        ZStack {
            ZStack {
                Text(text).offset(x: width, y: width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y: width)
                Text(text).offset(x: width, y: -width)
            }
            .foregroundColor(color)
            .font(font)
            .fontWeight(fontWeight)
            .italic(isItalic)  // ADD THIS
            
            Text(text)
                .font(font)
                .fontWeight(fontWeight)
                .italic(isItalic)  // ADD THIS
        }
    }
}
