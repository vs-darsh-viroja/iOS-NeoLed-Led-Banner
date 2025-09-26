//
//  EditFilterView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 26/09/25.
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

struct Shape {
    let shapeName: String
    let shapeIcon: String
}

struct EditTextView: View {
    
    @State var selectedEffect: String = "None"
    var effectOptions: [Effect] = [
        Effect(effectName: "None", effectImage: "noSelectionIcon"),
        Effect(effectName: "Bold", effectImage: "boldIcon"),
        Effect(effectName: "Light", effectImage: "lightIcon"),
        Effect(effectName: "Flash", effectImage: "flashIcon"),
        Effect(effectName: "Mirror", effectImage: "mirrorIcon"),
        Effect(effectName: "Stroke", effectImage: "strokeIcon"),
    ]
    
    @State var selectedAlignment: String = "None"
    var alignmentOptions: [TextAlignments] = [
        TextAlignments(alignmentName: "None", alignmentImage: "noSelectionIcon"),
        TextAlignments(alignmentName: "left", alignmentImage: "leftArrowIcon"),
        TextAlignments(alignmentName: "right", alignmentImage: "rightArrowIcon"),
        TextAlignments(alignmentName: "up", alignmentImage: "upArrowIcon"),
        TextAlignments(alignmentName: "down", alignmentImage: "downArrowIcon"),

    ]

    @State var selectedShape: String = "None"
    var shapeOption: [Shape] = [
        Shape(shapeName: "None", shapeIcon: "noSelectionIcon"),
        Shape(shapeName: "circle", shapeIcon: "circleIcon"),
        Shape(shapeName: "square", shapeIcon: "squareIcon"),
        Shape(shapeName: "heart", shapeIcon: "heartIcon2"),
        Shape(shapeName: "star1", shapeIcon: "starIcon1"),
        Shape(shapeName: "star2", shapeIcon: "starIcon2"),

    ]

    @State private var textSpeed: CGFloat = 1.0

    
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
                            ForEach(Array(effectOptions.enumerated()), id: \.offset) { index, effect in
                                
                                VStack(spacing: ScaleUtility.scaledSpacing(6)) {
                                    
                                    Button {
                                        selectedEffect = effect.effectName
                                    } label: {
                                        
                                        Image(effect.effectImage)
                                            .resizable()
                                            .frame(width: ScaleUtility.scaledValue(16), height: ScaleUtility.scaledValue(16))
                                            .padding(.all, ScaleUtility.scaledSpacing(13))
                                            .background {
                                                if selectedEffect == effect.effectName {
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
                                                    .stroke( selectedEffect == effect.effectName ? Color.accent : Color.clear, lineWidth: 1)
                                                
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
