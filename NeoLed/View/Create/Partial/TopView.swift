//
//  TopView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 26/09/25.
//

import Foundation
import SwiftUI

struct TopView:View {
    
    @Binding var text: String
    @FocusState.Binding var isInputFocused: Bool
    
    var body: some View {
        VStack(spacing: ScaleUtility.scaledSpacing(30)) {
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: ScaleUtility.scaledValue(335) ,height: ScaleUtility.scaledValue(147))
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 1, green: 0.73, blue: 0.79), location: 0.00),
                            Gradient.Stop(color: Color(red: 1, green: 0.84, blue: 0.6), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                )
                .cornerRadius(10)
                .overlay {
                    Text("Enter Your Text")
                        .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(36)))
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                .padding(.horizontal,ScaleUtility.scaledSpacing(20))
            
            HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(
                            EllipticalGradient(
                                stops: [
                                    Gradient.Stop(color: .white.opacity(0.1), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0.1), location: 0.78),
                                ],
                                center: UnitPoint(x: 0.36, y: 0.34)
                            )
                        )
                        .frame(height:ScaleUtility.scaledValue(37) * heightRatio)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primaryApp.opacity(0.15), lineWidth: 1)
                                .foregroundColor(Color.clear)
                                .frame(height:ScaleUtility.scaledValue(37) * heightRatio)
                        }
                    
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text("Enter Your Text")
                                .font(FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(14)))
                                .foregroundColor(Color.primaryApp)
                                .background(Color.clear)
                               
                        }
                        
                        TextField("", text: $text)
                            .focused($isInputFocused)
                            .foregroundColor(Color.primaryApp)
                            .font(FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(14)))
                            .padding(.vertical, ScaleUtility.scaledSpacing(10))
                            .textFieldStyle(PlainTextFieldStyle()) // <- Most important
                        
                    }
                    .offset(x: ScaleUtility.scaledSpacing(15))
                    
                }
                
                
                Text("Preview")
                  .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(14)))
                  .kerning(0.42)
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .padding(.vertical, ScaleUtility.scaledSpacing(9))
                  .padding(.horizontal, ScaleUtility.scaledSpacing(18))
                  .background(
                    EllipticalGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.4), location: 0.00),
                            Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.2), location: 0.78),
                        ],
                        center: UnitPoint(x: 0.36, y: 0.34)
                    )
                  )
                  .cornerRadius(5)
                  .overlay {
                      RoundedRectangle(cornerRadius: 5)
                          .stroke(.accent, lineWidth: 1)
                  }
            }
            .padding(.horizontal,ScaleUtility.scaledSpacing(20))
            
        }
        .padding(.top, ScaleUtility.scaledSpacing(59))
    }
}
