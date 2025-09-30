//
//  EditEffectView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 29/09/25.
//


import Foundation
import SwiftUI


struct Effect {
    let effectName: String
    let effectImage: String
}

struct TextAlignments {
    let alignmentName: String
    let alignmentImage: String
}

struct LEDShape {  // Changed from "Shape"
    let shapeName: String
    let shapeIcon: String
}
struct EditEffectView: View {
    
    @Binding var selectedEffect: Set<String>
    @Binding var selectedAlignment: String
    @Binding var selectedShape: String
    @Binding var textSpeed: CGFloat
    
    
    var effectOptions: [Effect] = [
        Effect(effectName: "None", effectImage: "noSelectionIcon"),
        Effect(effectName: "Bold", effectImage: "boldIcon"),
        Effect(effectName: "Light", effectImage: "lightIcon"),
        Effect(effectName: "Flash", effectImage: "flashIcon"),
        Effect(effectName: "Mirror", effectImage: "mirrorIcon"),
        Effect(effectName: "Stroke", effectImage: "strokeIcon"),
    ]
    
   
    var alignmentOptions: [TextAlignments] = [
        TextAlignments(alignmentName: "None", alignmentImage: "noSelectionIcon"),
        TextAlignments(alignmentName: "left", alignmentImage: "leftArrowIcon"),
        TextAlignments(alignmentName: "right", alignmentImage: "rightArrowIcon"),
        TextAlignments(alignmentName: "up", alignmentImage: "upArrowIcon"),
        TextAlignments(alignmentName: "down", alignmentImage: "downArrowIcon"),

    ]

    
    var shapeOption: [LEDShape] = [
        LEDShape(shapeName: "None", shapeIcon: "noSelectionIcon"),
        LEDShape(shapeName: "circle", shapeIcon: "circleIcon"),
        LEDShape(shapeName: "square", shapeIcon: "squareIcon"),
        LEDShape(shapeName: "heart", shapeIcon: "heartIcon2"),
        LEDShape(shapeName: "star", shapeIcon: "starIcon"),
        LEDShape(shapeName: "ninjaStar", shapeIcon: "ninjaStarIcon"),
    ]

  

    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: ScaleUtility.scaledSpacing(20)) {
                
                VStack(spacing: ScaleUtility.scaledSpacing(10)) {
                    Text("Text Effect")
                        .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.5942)))
                        .kerning(0.40783)
                        .foregroundColor(.white.opacity(0.5))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading, ScaleUtility.scaledSpacing(30))
                    
                    ScrollView(.horizontal) {
                        
                        HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                            
                            ForEach(Array(effectOptions.enumerated()), id: \.offset) { _, effect in
                                
                                VStack(spacing: ScaleUtility.scaledSpacing(6)) {
                                    
                                    let isSelected = selectedEffect.contains(effect.effectName)
                                    
                                    Button {
                    
                                        // Toggle selection
                                        if isSelected {
                                            selectedEffect.remove(effect.effectName)
                                        } else {
                                            selectedEffect.insert(effect.effectName)
                                        }
                                        
                                    } label: {
                                        
                                        Image(effect.effectImage)
                                            .resizable()
                                            .frame(width: ScaleUtility.scaledValue(16), height: ScaleUtility.scaledValue(16))
                                            .padding(.all, ScaleUtility.scaledSpacing(13))
                                            .background {
                                                if isSelected {
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
                                                    .stroke( isSelected ? Color.accent : Color.clear, lineWidth: 1)
                                                
                                            }
                                    }
                                        
                                        Text(effect.effectName)
                                            .font(FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(12)))
                                            .foregroundColor(Color.primaryApp)
                                    
                                }
                            }
                            
                            
                        }
                        .frame(alignment: .leading)
                        .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                    }
                    
                }
               
                
                VStack(spacing: ScaleUtility.scaledSpacing(10)) {
                    Text("Text Speed")
                        .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.5942)))
                        .kerning(0.40783)
                        .foregroundColor(.white.opacity(0.5))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading, ScaleUtility.scaledSpacing(30))
                    
                    ReusableCustomSlider(value: $textSpeed, range: 0.5...5.0)
                      
                    
                    ScrollView(.horizontal) {
                        
                        HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                            ForEach(Array(alignmentOptions.enumerated()), id: \.offset) { index, align in
                                
                                Button {
                                    selectedAlignment = align.alignmentName
                                } label: {
                                    Image(align.alignmentImage)
                                        .resizable()
                                        .frame(width: ScaleUtility.scaledValue(16), height: ScaleUtility.scaledValue(16))
                                        .padding(.all, ScaleUtility.scaledSpacing(13))
                                        .background {
                                            if selectedAlignment == align.alignmentName {
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
                                                .stroke( selectedAlignment == align.alignmentName ? Color.accent : Color.clear, lineWidth: 1)
                                            
                                        }
                                }
                                
                                
                            }
                            
                            
                            
                            
                        }
                        .frame(alignment: .leading)
                        .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                    }
                }
           
                
                
                VStack(spacing: ScaleUtility.scaledSpacing(10)) {
                    Text("LED Type")
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
        
    }
}
