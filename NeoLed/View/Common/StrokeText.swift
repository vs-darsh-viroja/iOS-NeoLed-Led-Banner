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
            
            Text(text)
                .font(font)
                .fontWeight(fontWeight)
        }
    }
}
