//
//  LEDGlowModifier.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 30/09/25.
//

import Foundation
import SwiftUI

struct LEDGlowModifier: ViewModifier {
    let color: Color
    let intensity: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Canvas { context, size in
                    context.addFilter(.alphaThreshold(min: 0.5))
                    context.addFilter(.blur(radius: 10 * intensity))
                    context.drawLayer { ctx in
                        if let resolvedView = context.resolveSymbol(id: 0) {
                            ctx.draw(resolvedView, at: CGPoint(x: size.width/2, y: size.height/2))
                        }
                    }
                } symbols: {
                    content.tag(0)
                }
            )
    }
}


