//
//  ColorModifier.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 30/09/25.
//

import Foundation
import SwiftUI

struct ColorModifier: ViewModifier {
    let colorOption: ColorOption
    
    func body(content: Content) -> some View {
        colorOption.applyToText(content)
    }
}
