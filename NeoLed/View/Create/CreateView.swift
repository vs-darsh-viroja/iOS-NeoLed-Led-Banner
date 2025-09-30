//
//  CreateView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 24/09/25.
//

import Foundation
import SwiftUI

struct CreateView: View {
    @FocusState private var inputFocused: Bool
    @State var text: String = ""
    
    @State var selectedEditOption: String = "Text"
    var editOptions = ["Text",
                       "Effect",
                       "Background"]
    
    // Text customization states
     @State private var textSize: CGFloat = 1.0
     @State private var strokeSize: CGFloat = 0.0
     @State private var selectedFont: String = FontManager.bricolageGrotesqueBoldFont
     @State private var selectedColor: ColorOption = ColorOption.predefinedColors[0]
     @State private var selectedOutlineColor: OutlineColorOption = OutlineColorOption.predefinedOutlineColors[0]
     @State private var outlineEnabled = false
     @State private var hasCustomTextColor = false
     @State private var customTextColor: UIColor = .white
     
     // Effect customization states
     @State private var selectedEffects: Set<String> = ["None"]
     @State private var selectedAlignment: String = "None"
     @State private var selectedShape: String = "None"
     @State private var textSpeed: CGFloat = 1.0
     @State var showPreview: Bool = false
    
    var body: some View {
        VStack(spacing:0) {
            
            VStack(spacing: ScaleUtility.scaledSpacing(23)) {
                
                TopView(text: $text, isInputFocused: $inputFocused) {
                    showPreview = true
                }
                
                
                HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                    ForEach(Array(editOptions.enumerated()), id: \.offset) { index, option in
                        Button {
                            selectedEditOption = option
                        } label: {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: ScaleUtility.scaledValue(102), height: ScaleUtility.scaledValue(34))
                                .foregroundColor(Color.clear)
                                .background {
                                    if selectedEditOption == option {
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
                                    Text(option)
                                        .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(14)))
                                        .kerning(0.42)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color.primaryApp)
                                }
                                .overlay {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke( selectedEditOption == option ? Color.accent : Color.clear, lineWidth: 1)
                                    
                                }
                        }
                    }
                }
            }
            
            ScrollView {
                
                Spacer()
                    .frame(height: ScaleUtility.scaledValue(15))
                
                if selectedEditOption == "Effect" {
                    EditEffectView(selectedEffect: $selectedEffects,
                                   selectedAlignment: $selectedAlignment,
                                   selectedShape: $selectedShape,
                                   textSpeed: $textSpeed)
                
                }
                else if selectedEditOption == "Text" {
                    EditTextView(
                        textSize: $textSize,
                        strokeSize: $strokeSize,
                        selectedFont: $selectedFont,
                        selectedColor: $selectedColor,
                        selectedOutlineColor: $selectedOutlineColor,
                        outlineEnabled: $outlineEnabled,
                        hasCustomTextColor: $hasCustomTextColor,
                        customTextColor: $customTextColor
                    )
                }
                
                Spacer()
                    .frame(height: ScaleUtility.scaledValue(105))
                  
            }
           
            
            
            
            Spacer()
        }
        .background {
            Image(.background)
                .resizable()
                .scaledToFill()
        }
        .navigationDestination(isPresented: $showPreview) {
            ResultView(
                  text: text,
                  selectedFont: selectedFont,
                  textSize: textSize,
                  strokeSize: strokeSize,
                  selectedColor: selectedColor,
                  selectedOutlineColor: selectedOutlineColor,
                  outlineEnabled: outlineEnabled,
                  hasCustomTextColor: hasCustomTextColor,
                  customTextColor: customTextColor,
                  selectedEffects: selectedEffects,  // Add this line
                  selectedAlignment: selectedAlignment,
                  selectedShape: selectedShape,
                  textSpeed: textSpeed,
                  onBack: {
                      showPreview = false
                  }
              )
            .background {
                Image(.background)
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}
