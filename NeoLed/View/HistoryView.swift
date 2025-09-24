//
//  HistoryView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 24/09/25.
//

import Foundation
import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack {
            
        }
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03), location: 0.00),
                    Gradient.Stop(color: .black, location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: -1.55),
                endPoint: UnitPoint(x: 0.5, y: 0.32)
            )
        )
        .ignoresSafeArea(.all)
    }
}
