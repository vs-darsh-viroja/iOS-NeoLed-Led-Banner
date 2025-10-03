//
//  EditEffectView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 29/09/25.
//


import Foundation
import SwiftUI


struct LEDShape {  // Changed from "Shape"
    let shapeName: String
    let shapeIcon: String
}
struct EditBackgroundView: View {
    
    @Binding var isHD: Bool
    @Binding var selectedShape: String
    @Binding var selectedBgColor: OutlineColorOption
    @Binding var backgroundEnabled: Bool
    
    var shapeOption: [LEDShape] = [
        LEDShape(shapeName: "None", shapeIcon: "noSelectionIcon"),
        LEDShape(shapeName: "circle", shapeIcon: "circleIcon"),
        LEDShape(shapeName: "square", shapeIcon: "squareIcon"),
        LEDShape(shapeName: "heart", shapeIcon: "heartIcon2"),
        LEDShape(shapeName: "star", shapeIcon: "starIcon"),
        LEDShape(shapeName: "ninjaStar", shapeIcon: "ninjaStarIcon"),
    ]
    
    
    
    @State private var showBgColorPicker = false
    @State private var customBgColor: UIColor = .blue
    @State private var hasCustomBgColor = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: ScaleUtility.scaledSpacing(20)) {
                
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        OutlineColorPickerView(
                            text: "Background Color",
                            selectedOutlineColor: $selectedBgColor,
                            showColorPicker: $showBgColorPicker,
                            hasCustomColor: $hasCustomBgColor,
                            customColor: $customBgColor,
                            outlineEnabled: $backgroundEnabled
                        )
                        .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                    }
                
                
                VStack(spacing: ScaleUtility.scaledSpacing(15)) {
                    Text("Banner Type")
                       .font(FontManager.bricolageGrotesqueMediumFont(size: 13.5942))
                      .kerning(0.40783)
                      .foregroundColor(Color.primaryApp.opacity(0.5))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                      .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                    
                    HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                        
                        Button {
                            isHD = false
                        } label: {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: ScaleUtility.scaledValue(102), height: ScaleUtility.scaledValue(34))
                                .foregroundColor(Color.clear)
                                .background {
                                    if !isHD {
                                        EllipticalGradient(
                                         stops: [
                                             Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.4), location: 0.00),
                                             Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.2), location: 0.78),
                                         ],
                                         center: UnitPoint(x: 0.36, y: 0.34)
                                        )
                                    }
                                    else {
                                        
                                        Color(red: 0.26, green: 0.25, blue: 0.25).opacity(0.5)
                                    }
                                }
                                .cornerRadius(5)
                                .overlay {
                                    Text("LED")
                                        .font(FontManager.bricolageGrotesqueRegularFont(size: 14))
                                        .kerning(0.42)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                }
                                .overlay {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(!isHD  ? Color.accent : Color.clear, lineWidth: 1)
                                }
                        }

                        
                        Button {
                            isHD = true
                        } label: {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: ScaleUtility.scaledValue(102), height: ScaleUtility.scaledValue(34))
                                .foregroundColor(Color.clear)
                                .background {
                                    if isHD {
                                        EllipticalGradient(
                                         stops: [
                                             Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.4), location: 0.00),
                                             Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.2), location: 0.78),
                                         ],
                                         center: UnitPoint(x: 0.36, y: 0.34)
                                        )
                                    }
                                    else {
                                        
                                        Color(red: 0.26, green: 0.25, blue: 0.25).opacity(0.5)
                                    }
                                }
                                .cornerRadius(5)
                                .overlay {
                                    Text("HD")
                                        .font(FontManager.bricolageGrotesqueRegularFont(size: 14))
                                        .kerning(0.42)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                }
                                .overlay {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(isHD  ? Color.accent : Color.clear, lineWidth: 1)
                                }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                }
                
                
                VStack(spacing: ScaleUtility.scaledSpacing(15)) {
                    Text("LED Shape Type")
                        .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.5942)))
                        .kerning(0.40783)
                        .foregroundColor(.white.opacity(0.5))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading, ScaleUtility.scaledSpacing(30))
               
                    ScrollView(.horizontal) {
                        HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                            ForEach(Array(shapeOption.enumerated()), id: \.offset) { index, shape in
                                
                                Button {
                                    selectedShape = shape.shapeName
                                } label: {
                                    
                                    Image(shape.shapeIcon)
                                        .resizable()
                                        .frame(width: ScaleUtility.scaledValue(16), height: ScaleUtility.scaledValue(16))
                                        .padding(.all, ScaleUtility.scaledSpacing(13))
                                        .background {
                                            if selectedShape == shape.shapeName {
                                                EllipticalGradient(
                                                    stops: [
                                                        Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.4), location: 0.00),
                                                        Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.2), location: 0.78),
                                                    ],
                                                    center: UnitPoint(x: 0.36, y: 0.34)
                                                )
                                            }
                                            else {
                                                Color.appGrey
                                            }
                                        }
                                        .cornerRadius(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke( selectedShape == shape.shapeName ? Color.accent : Color.clear, lineWidth: 1)
                                            
                                        }
                                }
                                
                            }
                            
                        }
                        .frame(alignment: .leading)
                        .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                    }
                }
           
            }
          
        }
        .sheet(isPresented: $showBgColorPicker) {
            ColorPickerSheet(
                uiColor: $customBgColor,
                isPresented: $showBgColorPicker,
                onColorApplied: { color in
                    customBgColor = color
                    selectedBgColor = OutlineColorOption(
                        id: "custom_outline",
                        name: "Custom",
                        color: Color(color)
                    )
                    hasCustomBgColor = true
                    backgroundEnabled = true
                }
            )
            .presentationDetents(isIPad ? [.large, .fraction(0.95)] : [.fraction(0.9)])
        }
    }
}
