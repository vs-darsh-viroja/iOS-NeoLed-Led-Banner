//
//  ColorPickerSheet.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 29/09/25.
//

import Foundation
import SwiftUI


struct ColorPickerSheet: View {
    @Binding var uiColor: UIColor
    @Binding var isPresented: Bool
    let onColorApplied: (UIColor) -> Void
    
    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
    let selectionFeedback = UISelectionFeedbackGenerator()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Dark background
            Color.black.ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    
                    Spacer()
                    
                    Button {
                        impactFeedback.impactOccurred()
                        isPresented = false
                    } label: {
                        Image(.crossIcon3)
                            .frame(width: ScaleUtility.scaledValue(12), height: ScaleUtility.scaledValue(12))
                            .padding(.all, ScaleUtility.scaledSpacing(5))
                            .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.24))
                            .cornerRadius(30)
        
                    }
                    
                    
                }
                .padding(.all, ScaleUtility.scaledSpacing(15))
                .background(Color.black)
                
          
                    SystemColorPicker(
                        uiColor: $uiColor,
                        onDismiss: {
                            // Handle dismiss if needed
                        },
                        onColorSelected: { _ in
                            // Color updates in real-time
                        }
                    )
                    .background(Color.black)
              
                
                Spacer()
         
            }
            
            Button {
                impactFeedback.impactOccurred()
                onColorApplied(uiColor)
                isPresented = false
            } label: {
                
                Text("Select")
                    .font(FontManager.bricolageGrotesqueBoldFont(size: .scaledFontSize(13.46154)))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.secondaryApp)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 40.38462)
            .background(Color.accent)
            .cornerRadius(9.61538)
            .frame(maxWidth: .infinity)
            .padding(.bottom, ScaleUtility.scaledSpacing(28.44))
            .padding(.horizontal, ScaleUtility.scaledSpacing(57))
          
        }
        .preferredColorScheme(.dark) // Force dark scheme for the entire sheet
    }
}

