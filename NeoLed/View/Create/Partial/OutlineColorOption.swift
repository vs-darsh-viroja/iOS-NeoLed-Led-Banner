//
//  OutlineColorOption.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 29/09/25.
//


import SwiftUI

struct OutlineColorOption: Identifiable {
    let id: String
    let name: String
    let color: Color
    
    // Get the view for color picker display
    @ViewBuilder
    func colorPreview(size: CGFloat = 28) -> some View {
        Rectangle()
            .foregroundColor(color)
            .frame(width: size, height: size)
            .cornerRadius(5)
    }
}

// MARK: - Predefined Outline Colors
extension OutlineColorOption {
    static let predefinedOutlineColors: [OutlineColorOption] = [
        // Single Row - 8 colors (no gradients for outline)
        OutlineColorOption(id: "outlineIndigoBlue", name: "Indigo Blue", color: Color.appIndigoBlue),
        OutlineColorOption(id: "outlineLightRed", name: "Light Red", color: Color.appLightRed),
        OutlineColorOption(id: "outlineLimeGreen", name: "Lime Green", color: Color.appLimeGreen ),
        OutlineColorOption(id: "outlineCyan", name: "Cyan", color: Color.appCyan),
        OutlineColorOption(id: "outlinePersian", name: "Persian", color: Color.appPersian),
        OutlineColorOption(id: "outlineOrange", name: "Orange", color: Color.appOrange),
        OutlineColorOption(id: "outlineDarkBlue", name: "Dark Blue", color: Color.appDarkBlue),
        OutlineColorOption(id: "outlineRed", name: "Red", color: Color.appRed)
    ]
}

// =============================================================================
// Outline Color Picker View
// =============================================================================

struct OutlineColorPickerView: View {
    var text: String
    @Binding var selectedOutlineColor: OutlineColorOption
    @Binding var showColorPicker: Bool
    @Binding var hasCustomColor: Bool
    @Binding var customColor: UIColor
    @Binding var outlineEnabled: Bool
    
    var body: some View {
        VStack(spacing: ScaleUtility.scaledSpacing(15)) {
            
            Text(text)
                .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.5942)))
                .kerning(0.40783)
                .foregroundColor(Color.primaryApp.opacity(0.5))
                .frame(maxWidth: .infinity, alignment: .topLeading)
            
            HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                
                // Add Custom Color Button
                Button(action: {
                    showColorPicker.toggle()
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: ScaleUtility.scaledValue(28), height: ScaleUtility.scaledValue(28))
                            .cornerRadius(5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(
                                        (hasCustomColor && outlineEnabled) ? Color.accent : Color.clear,
                                        lineWidth: 2
                                    )
                            }
                        
                        // Show custom color if selected
                        if hasCustomColor && outlineEnabled {
                            Rectangle()
                                .fill(Color(customColor))
                                .frame(
                                    width: ScaleUtility.scaledValue(22),
                                    height: ScaleUtility.scaledValue(22)
                                )
                                .cornerRadius(5)
                        } else {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: ScaleUtility.scaledValue(28), height: ScaleUtility.scaledValue(28))
                                .cornerRadius(5)
                                .overlay {
                                    Image(.plusIcon)
                                        .resizable()
                                        .frame(width: ScaleUtility.scaledValue(14), height: ScaleUtility.scaledValue(14))
                                }
                        }
                    }
                }
                
                // No Outline Button
                
                ZStack {
                    
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: ScaleUtility.scaledValue(28), height: ScaleUtility.scaledValue(28))
                    .foregroundColor(Color.clear)
                    .background(Color.clear)
                    .cornerRadius(5.83333)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(!outlineEnabled ? Color.accent : Color.clear, lineWidth: 1)
                    }
                    
                    Button(action: {
                        outlineEnabled = false
                    }) {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: !outlineEnabled ? ScaleUtility.scaledValue(22) : ScaleUtility.scaledValue(28),
                                   height: !outlineEnabled ? ScaleUtility.scaledValue(22) : ScaleUtility.scaledValue(28))
                            .cornerRadius(5)
                            .overlay {
                                Image(.skipIcon)
                                    .resizable()
                                    .frame(width: ScaleUtility.scaledValue(14), height: ScaleUtility.scaledValue(14))
                                    .foregroundColor(.black)
                            }
                    
                    }
                }
                
                // Predefined Colors
                ForEach(OutlineColorOption.predefinedOutlineColors) { colorOption in
                    outlineColorButton(colorOption)
                }
            }
            .frame(height: ScaleUtility.scaledValue(30))
        }
    }
    
    @ViewBuilder
    private func outlineColorButton(_ colorOption: OutlineColorOption) -> some View {
        
        ZStack {
            
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: ScaleUtility.scaledValue(28), height: ScaleUtility.scaledValue(28))
            .foregroundColor(Color.clear)
            .background(Color.clear)
            .cornerRadius(5.83333)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(
                        (outlineEnabled && selectedOutlineColor.id == colorOption.id) ? Color.accent : Color.clear,
                        lineWidth: 1
                    )
            }
            
            Button(action: {
                selectedOutlineColor = colorOption
                outlineEnabled = true
            }) {
                colorOption.colorPreview(size: (outlineEnabled && selectedOutlineColor.id == colorOption.id) ? ScaleUtility.scaledValue(22) : ScaleUtility.scaledValue(28))
            }
        }
    }
}
